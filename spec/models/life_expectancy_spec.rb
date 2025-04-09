require 'rails_helper'

RSpec.describe LifeExpectancy, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:location) }
    it { is_expected.to belong_to(:variant) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:birth_year) }
    it { is_expected.to validate_numericality_of(:birth_year).only_integer }

    it { is_expected.to validate_presence_of(:life_expectancy_both) }
    it { is_expected.to validate_numericality_of(:life_expectancy_both) }

    it { is_expected.to validate_presence_of(:life_expectancy_male) }
    it { is_expected.to validate_numericality_of(:life_expectancy_male) }

    it { is_expected.to validate_presence_of(:life_expectancy_female) }
    it { is_expected.to validate_numericality_of(:life_expectancy_female) }

    it { is_expected.to allow_value(nil).for(:loc_id) }
    it { is_expected.to validate_numericality_of(:loc_id).only_integer }
  end

  describe '.ransackable_attributes' do
    it 'returns' do
      expect(LifeExpectancy.ransackable_attributes).to match_array(["id", "birth_year", "location_id"])
    end
  end
end
