class CreateWeeksInLives < ActiveRecord::Migration[8.0]
  def change
    create_table :weeks_in_lives do |t|
      t.date :start_date
      t.date :end_date
      t.integer :week_number
      t.string :memo, limit: 2048
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
