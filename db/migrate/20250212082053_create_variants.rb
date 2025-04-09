class CreateVariants < ActiveRecord::Migration[8.0]
  def change
    create_table :variants do |t|
      t.integer :var_id
      t.string :variant, limit: 255

      t.timestamps
    end
  end
end
