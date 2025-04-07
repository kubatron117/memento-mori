require 'rails_helper'

RSpec.describe WeeksInLife, type: :model do
  let(:account) do
    Account.create!(
      email: "test@example.com",
      date_of_birth: Date.today - 30.years,
      estimated_lifespan: Date.today + 30.years,
      status: :verified
    )
  end

  describe 'associations' do
    it { is_expected.to belong_to(:account) }
  end

  describe 'validations' do
    subject do
      WeeksInLife.new(
        start_date: Date.today,
        end_date: Date.today + 7.days,
        week_number: 1,
        year: 2020,
        account: account
      )
    end

    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:week_number) }
    it do
      is_expected.to validate_numericality_of(:week_number)
                       .only_integer
                       .is_greater_than(0)
                       .is_less_than_or_equal_to(53)
    end
    it do
      is_expected.to validate_uniqueness_of(:week_number)
                       .scoped_to(:account_id, :year)
                       .with_message("For this year is exist")
    end
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_numericality_of(:year).only_integer }
    it { is_expected.to validate_length_of(:memo).is_at_most(2048) }

    it { is_expected.to allow_value(nil).for(:score_satisfaction) }
    it { is_expected.to validate_numericality_of(:score_satisfaction).only_integer }
    it { is_expected.to allow_value(nil).for(:score_emotional_balance) }
    it { is_expected.to validate_numericality_of(:score_emotional_balance).only_integer }
    it { is_expected.to allow_value(nil).for(:score_productivity) }
    it { is_expected.to validate_numericality_of(:score_productivity).only_integer }
    it { is_expected.to allow_value(nil).for(:score_relationships) }
    it { is_expected.to validate_numericality_of(:score_relationships).only_integer }
    it { is_expected.to allow_value(nil).for(:score_values_alignment) }
    it { is_expected.to validate_numericality_of(:score_values_alignment).only_integer }
    it { is_expected.to allow_value(nil).for(:total_score) }
    it { is_expected.to validate_numericality_of(:total_score).only_integer }
  end

  describe 'custom validations' do
    describe '#end_date_after_start_date' do
      it 'error when end_date is before start_date' do
        weeks_in_life = WeeksInLife.new(
          start_date: Date.today,
          end_date: Date.yesterday,
          week_number: 1,
          year: 2020,
          account: account
        )
        weeks_in_life.validate
        expect(weeks_in_life.errors[:end_date]).to include("Must be after the start date")
      end
    end

    describe '#allowed_week_update' do
      it 'update error when start_date is not current or previous week' do
        weeks_in_life = WeeksInLife.create!(
          start_date: Date.current.beginning_of_week,
          end_date: Date.current.end_of_week,
          week_number: 1,
          year: 2020,
          account: account
        )
        weeks_in_life.start_date = Date.current.beginning_of_week - 14.days
        weeks_in_life.validate
        expect(weeks_in_life.errors[:base]).to include("Update is only allowed for the current week or the previous week")
      end

      it 'update ok when start_date is current or previous week' do
        weeks_in_life = WeeksInLife.create!(
          start_date: Date.current.beginning_of_week,
          end_date: Date.current.end_of_week,
          week_number: 2,
          year: 2020,
          account: account
        )
        weeks_in_life.start_date = Date.current.beginning_of_week - 7.days
        weeks_in_life.validate
        expect(weeks_in_life.errors[:base]).to be_empty
      end
    end
  end

  describe 'callbacks' do
    describe 'before_save :count_total_score' do
      it 'count total_score, where score attributes was changed' do
        weeks_in_life = WeeksInLife.new(
          start_date: Date.current.beginning_of_week,
          end_date: Date.current.end_of_week,
          week_number: 1,
          year: 2020,
          account: account,
          score_satisfaction: 3,
          score_emotional_balance: 4,
          score_productivity: 5,
          score_relationships: 2,
          score_values_alignment: 1
        )
        weeks_in_life.save!
        expect(weeks_in_life.total_score).to eq(3 + 4 + 5 + 2 + 1)
      end

      it 'not updated total_score when score attributes are empty' do
        weeks_in_life = WeeksInLife.create!(
          start_date: Date.current.beginning_of_week,
          end_date: Date.current.end_of_week,
          week_number: 2,
          year: 2020,
          account: account,
          score_satisfaction: nil,
          score_emotional_balance: nil,
          score_productivity: nil,
          score_relationships: nil,
          score_values_alignment: nil
        )
        expect(weeks_in_life.total_score).to be_nil
      end
    end
  end
end
