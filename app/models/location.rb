class Location < ApplicationRecord
  validates :location, presence: true, length: { maximum: 255 }
  validates :iso3_code, length: { is: 3 }, allow_blank: true
  validates :iso2_code, length: { is: 2 }, allow_blank: true
  validates :loc_type_id, numericality: { only_integer: true }, allow_nil: true
  validates :loc_type_name, length: { maximum: 255 }, allow_blank: true
end
