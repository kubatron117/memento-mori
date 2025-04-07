require 'rails_helper'

RSpec.describe Variant, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:variant) }
    it { is_expected.to validate_length_of(:variant).is_at_most(255) }

    it { is_expected.to allow_value(nil).for(:var_id) }
    it { is_expected.to validate_numericality_of(:var_id).only_integer }
  end
end
