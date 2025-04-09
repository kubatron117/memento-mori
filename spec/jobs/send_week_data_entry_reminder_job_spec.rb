require 'rails_helper'

ActiveJob::Base.queue_adapter = :test

RSpec.describe SendWeekDataEntryReminderJob, type: :job do
  include ActiveJob::TestHelper

  before(:each) do
    WeeksInLife.destroy_all
    Account.destroy_all
    clear_enqueued_jobs
    clear_performed_jobs
  end

  let(:current_week) { Date.current.cweek }
  let(:current_year) { Date.current.year }

  let!(:account_with_missing_memo) do
    account = Account.create!(
      email: "qualify@example.com",
      date_of_birth: Date.current - 30.years,
      estimated_lifespan: Date.current + 30.years,
      status: :verified
    )
    account.weeks_in_lives.create!(
      start_date: Date.current.beginning_of_week,
      end_date: Date.current.end_of_week,
      week_number: current_week,
      year: current_year,
      memo: nil
    )
    account
  end

  let!(:account_with_empty_memo) do
    account = Account.create!(
      email: "empty@example.com",
      date_of_birth: Date.current - 30.years,
      estimated_lifespan: Date.current + 30.years,
      status: :verified
    )
    account.weeks_in_lives.create!(
      start_date: Date.current.beginning_of_week,
      end_date: Date.current.end_of_week,
      week_number: current_week,
      year: current_year,
      memo: ''
    )
    account
  end

  let!(:account_with_filled_memo) do
    account = Account.create!(
      email: "filled@example.com",
      date_of_birth: Date.current - 30.years,
      estimated_lifespan: Date.current + 30.years,
      status: :verified
    )
    account.weeks_in_lives.create!(
      start_date: Date.current.beginning_of_week,
      end_date: Date.current.end_of_week,
      week_number: current_week,
      year: current_year,
      memo: 'already filled'
    )
    account
  end

  it "enqueues the job on the default queue" do
    expect {
      SendWeekDataEntryReminderJob.perform_later
    }.to have_enqueued_job(SendWeekDataEntryReminderJob).on_queue("default")
  end

  it "sends reminder emails only to accounts with missing memo" do
    mail_double = double("mail", deliver_later: true)
    allow(WeeksInLivesMailer).to receive(:week_reminder).and_return(mail_double)

    SendWeekDataEntryReminderJob.perform_now

    expect(WeeksInLivesMailer).to have_received(:week_reminder).with(account_with_missing_memo).at_least(:once)
    expect(WeeksInLivesMailer).to have_received(:week_reminder).with(account_with_empty_memo).at_least(:once)
    expect(WeeksInLivesMailer).not_to have_received(:week_reminder).with(account_with_filled_memo)
  end
end
