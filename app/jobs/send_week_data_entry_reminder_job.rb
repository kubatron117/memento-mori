class SendWeekDataEntryReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    accounts = Account.joins(:weeks_in_lives)
                      .where(weeks_in_lives: { memo: [nil, ''] })
                      .distinct

    accounts.find_each do |account|
      WeeksInLivesMailer.week_reminder(account).deliver_later
    end
  end
end
