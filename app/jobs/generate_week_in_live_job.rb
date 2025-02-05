class GenerateWeeksInLiveJob < ApplicationJob
  queue_as :default

  def perform
    target_week_start = next_week_start

    Account.find_each do |account|
      generate_missing_weeks_for(account, target_week_start)
    end
  end

  private

  def next_week_start
    (Date.current + 7.days).beginning_of_week
  end

  def generate_missing_weeks_for(account, target_week_start)
    last_week_record = WeeksInLife.where(account: account).order(start_date: :desc).first

    week_to_create = last_week_record ? last_week_record.start_date + 7.days : target_week_start

    while week_to_create <= target_week_start
      create_week_record(account, week_to_create)
      week_to_create += 7.days
    end
  end

  def create_week_record(account, week_start_date)
    WeeksInLife.find_or_create_by!(
      account: account,
      week_number: week_start_date.cweek,
      year: week_start_date.cwyear
    ) do |record|
      record.start_date = week_start_date
      record.end_date   = week_start_date.end_of_week
    end
  end
end
