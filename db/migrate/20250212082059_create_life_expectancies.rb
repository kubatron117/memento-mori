class CreateLifeExpectancies < ActiveRecord::Migration[8.0]
  def change
    create_table :life_expectancies do |t|
      t.integer :birth_year
      t.float :life_expectancy_both
      t.float :life_expectancy_male
      t.float :life_expectancy_female
      t.integer :loc_id
      t.references :location, null: false, foreign_key: true
      t.references :variant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
