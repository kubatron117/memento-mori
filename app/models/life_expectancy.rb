class LifeExpectancy < ApplicationRecord
  belongs_to :location
  belongs_to :variant

  validates :birth_year, presence: true, numericality: { only_integer: true }
  validates :life_expectancy_both, presence: true, numericality: true
  validates :life_expectancy_male, presence: true, numericality: true
  validates :life_expectancy_female, presence: true, numericality: true
  validates :loc_id, numericality: { only_integer: true }, allow_nil: true
end
