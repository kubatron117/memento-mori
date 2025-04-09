class WeeksInLife < ApplicationRecord
  belongs_to :account

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :week_number,
            presence: true,
            numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 53 },
            uniqueness: { scope: [:account_id, :year], message: "For this year is exist" }
  validates :year,
            presence: true,
            numericality: { only_integer: true }
  validates :memo, length: { maximum: 2048 }, allow_blank: true
  validates :score_satisfaction, numericality: { only_integer: true, allow_nil: true }
  validates :score_emotional_balance, numericality: { only_integer: true, allow_nil: true }
  validates :score_productivity, numericality: { only_integer: true, allow_nil: true }
  validates :score_relationships, numericality: { only_integer: true, allow_nil: true }
  validates :score_values_alignment, numericality: { only_integer: true, allow_nil: true }
  validates :total_score, numericality: { only_integer: true, allow_nil: true }

  validate :end_date_after_start_date
  validate :allowed_week_update, on: :update

  before_save :count_total_score, if: :score_attributes_updated?

  private

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?
    if end_date < start_date
      errors.add(:end_date, "Must be after the start date")
    end
  end

  def allowed_week_update
    allowed_start_dates = [
      Date.current.beginning_of_week,
      Date.current.beginning_of_week - 7.days
    ]

    unless allowed_start_dates.include?(start_date)
      errors.add(:base, "Update is only allowed for the current week or the previous week")
    end
  end

  def count_total_score
    self.total_score = score_satisfaction.to_i +
      score_emotional_balance.to_i +
      score_productivity.to_i +
      score_relationships.to_i +
      score_values_alignment.to_i
  end

  def score_attributes_updated?
    score_attrs = %w[
      score_satisfaction
      score_emotional_balance
      score_productivity
      score_relationships
      score_values_alignment
    ]

    score_attrs.any? do |attr|
      will_save_change_to_attribute?(attr) && self.send(attr).present?
    end
  end
end
