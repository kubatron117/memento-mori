class SendWeekDataEntryReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    current_week = Date.current.cweek
    current_year = Date.current.year

    accounts = Account.joins(:weeks_in_lives)
                      .where(
                        weeks_in_lives: {
                          memo: [nil, ''],
                          week_number: current_week,
                          year: current_year
                        }
                      ).distinct

    accounts.find_each do |account|
      WeeksInLivesMailer.week_reminder(account).deliver_later
    end
  end
end
