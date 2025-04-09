require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_length_of(:location).is_at_most(255) }

    it { is_expected.to allow_value("").for(:iso3_code) }
    it { is_expected.to allow_value(nil).for(:iso3_code) }
    it { is_expected.to validate_length_of(:iso3_code).is_equal_to(3) }

    it { is_expected.to allow_value("").for(:iso2_code) }
    it { is_expected.to allow_value(nil).for(:iso2_code) }
    it { is_expected.to validate_length_of(:iso2_code).is_equal_to(2) }

    it { is_expected.to allow_value(nil).for(:loc_type_id) }
    it { is_expected.to validate_numericality_of(:loc_type_id).only_integer }

    it { is_expected.to allow_value("").for(:loc_type_name) }
    it { is_expected.to allow_value(nil).for(:loc_type_name) }
    it { is_expected.to validate_length_of(:loc_type_name).is_at_most(255) }
  end

  describe '.ransackable_attributes' do
    it 'returns' do
      expected_attributes = ["id", "location", "iso3_code", "iso2_code", "loc_type_id", "loc_type_name"]
      expect(Location.ransackable_attributes).to match_array(expected_attributes)
    end
  end
end
