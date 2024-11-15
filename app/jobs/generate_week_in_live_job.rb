class GenerateWeekInLiveJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # current_week_number = Date.current.cweek
    # puts current_week_number
    #
    # # Každý týden v pátek se pustí cron a vygenruje záznam pro všechny uživatele pro následujicí týden
    # # TODO: Nutno napsat na toto testy
    #
    #
    # current_week = WeekInLife.where(week_number: current_week_number, year: Date.current.year)
    #
    # if current_week.blank?
    #   Account.each do |account|
    #     WeekInLife.create(start_date: Date.current.beginning_of_week, end_date: Date.current.end_of_week,
    #                       week_number: current_week_number, year: Date.current.year, account_id: account.id)
    #   end
    # end
    #
    # if current_week.present?
    current_date = Date.current

    next_week_date = current_date + 7.days

    next_week_number = next_week_date.cweek
    next_year = next_week_date.cwyear

    Account.find_each do |account|
      weeks_in_life = WeekInLife.where(week_number: next_week_number, year: next_year, account_id: account.id)
      if weeks_in_life.blank?
        WeekInLife.create(
          start_date: next_week_date.beginning_of_week,
          end_date: next_week_date.end_of_week,
          week_number: next_week_number,
          year: next_year,
          account_id: account.id
        )
      end
    end
  end
end
