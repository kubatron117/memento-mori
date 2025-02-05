class WeeksInLife < ApplicationRecord
  belongs_to :account

  validate :allowed_week_update, on: :update


  private
  def allowed_week_update
    allowed_start_dates = [
      Date.current.beginning_of_week,
      Date.current.beginning_of_week - 7.days
    ]

    unless allowed_start_dates.include?(start_date)
      errors.add(:base, "Update is only allowed for the current week or the previous week")
    end
  end


end
