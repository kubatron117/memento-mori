class Location < ApplicationRecord
  validates :location, presence: true, length: { maximum: 255 }
  validates :iso3_code, length: { is: 3 }, allow_blank: true
  validates :iso2_code, length: { is: 2 }, allow_blank: true
  validates :loc_type_id, numericality: { only_integer: true }, allow_nil: true
  validates :loc_type_name, length: { maximum: 255 }, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "location", "iso3_code", "iso2_code", "loc_type_id", "loc_type_name"]
  end
end
