class Account < ApplicationRecord
  include Rodauth::Rails.model
  enum :status, { unverified: 1, verified: 2, closed: 3 }

  has_many :weeks_in_lives, dependent: :destroy

  validate :date_of_birth_cannot_be_in_the_future
  validate :estimated_lifespan_must_be_at_least_one_month
  validate :estimated_lifespan_cannot_be_in_the_past

  private

  def date_of_birth_cannot_be_in_the_future
    return if date_of_birth.blank?
    if date_of_birth > Date.today
      errors.add(:date_of_birth, "Cannot be in the future")
    end
  end

  def estimated_lifespan_must_be_at_least_one_month
    return if estimated_lifespan.blank? || date_of_birth.blank?
    if estimated_lifespan < date_of_birth + 1.month
      errors.add(:estimated_lifespan, "Must be at least one month after date of birth")
    end
  end

  def estimated_lifespan_cannot_be_in_the_past
    return if estimated_lifespan.blank?
    if estimated_lifespan < Date.today
      errors.add(:estimated_lifespan, "cannot be in the past")
    end
  end
end
