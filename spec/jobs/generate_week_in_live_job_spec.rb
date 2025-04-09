require 'rails_helper'

ActiveJob::Base.queue_adapter = :test

RSpec.describe GenerateWeekInLiveJob, type: :job do
  include ActiveJob::TestHelper

  before(:each) do
    WeeksInLife.destroy_all
    Account.destroy_all
  end

  let(:target_week_start) { (Date.current + 7.days).beginning_of_week }

  let(:account) do
    Account.create!(
      email: "test@example.com",
      date_of_birth: Date.current - 30.years,
      estimated_lifespan: Date.current + 30.years,
      status: :verified
    )
  end

  it "enqueues the job on the default queue" do
    expect {
      GenerateWeekInLiveJob.perform_later
    }.to have_enqueued_job(GenerateWeekInLiveJob).on_queue("default")
  end

  context "when account has no week records" do
    it "creates a week record starting from target_week_start" do
      account
      expect {
        GenerateWeekInLiveJob.perform_now
      }.to change { WeeksInLife.count }.by(1)

      week_record = WeeksInLife.last
      expect(week_record.start_date).to eq(target_week_start)
      expect(week_record.end_date).to eq(target_week_start.end_of_week)
      expect(week_record.week_number).to eq(target_week_start.cweek)
      expect(week_record.year).to eq(target_week_start.cwyear)
      expect(week_record.account).to eq(account)
    end
  end

  context "when account already has a week record for target_week_start" do
    before do
      account
      WeeksInLife.create!(
        account: account,
        start_date: target_week_start,
        end_date: target_week_start.end_of_week,
        week_number: target_week_start.cweek,
        year: target_week_start.cwyear
      )
    end

    it "does not create a duplicate week record" do
      expect {
        GenerateWeekInLiveJob.perform_now
      }.not_to change { WeeksInLife.count }
    end
  end

  context "when account has a week record older than target_week_start" do
    before do
      account
      previous_week_start = target_week_start - 7.days
      WeeksInLife.create!(
        account: account,
        start_date: previous_week_start,
        end_date: previous_week_start.end_of_week,
        week_number: previous_week_start.cweek,
        year: previous_week_start.cwyear
      )
    end

    it "creates a new week record for target_week_start" do
      expect {
        GenerateWeekInLiveJob.perform_now
      }.to change { WeeksInLife.count }.by(1)

      week_record = WeeksInLife.where(account: account, start_date: target_week_start).first
      expect(week_record).to be_present
      expect(week_record.end_date).to eq(target_week_start.end_of_week)
    end
  end

  context "when account estimated_lifespan is before target_week_start" do
    before do
      account.update!(estimated_lifespan: target_week_start - 1.day)
    end

    it "does not create any week records" do
      expect {
        GenerateWeekInLiveJob.perform_now
      }.not_to change { WeeksInLife.count }
    end
  end
end