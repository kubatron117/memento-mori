class CreateWeeksInLives < ActiveRecord::Migration[8.0]
  def change
    create_table :weeks_in_lives do |t|
      t.date :start_date
      t.date :end_date
      t.integer :week_number
      t.integer :year
      t.string :memo, limit: 2048
      t.integer :score_satisfaction
      t.integer :score_emotional_balance
      t.integer :score_productivity
      t.integer :score_relationships
      t.integer :score_values_alignment
      t.integer :total_score
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end

    add_index :weeks_in_lives, [:account_id, :week_number, :year], unique: true
    add_index :weeks_in_lives, :account_id
  end
end
