class Variant < ApplicationRecord
  validates :variant, presence: true, length: { maximum: 255 }
  validates :var_id, numericality: { only_integer: true }, allow_nil: true
end