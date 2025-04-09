class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.string :location, limit: 255
      t.string :iso3_code, limit: 3, null: true
      t.string :iso2_code, limit: 2, null: true
      t.integer :loc_type_id, null: true
      t.string :loc_type_name, limit: 255, null: true

      t.timestamps
    end

    add_index :locations, :location
  end
end
