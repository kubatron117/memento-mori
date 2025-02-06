class WeeksInLife < ApplicationRecord
  belongs_to :account

  validate :allowed_week_update, on: :update

  before_save :count_total_score, if: :score_attributes_updated?

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
