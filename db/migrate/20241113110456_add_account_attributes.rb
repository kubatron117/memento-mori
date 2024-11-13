class AddAccountAttributes < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :first_name, :string, limit: 50
    add_column :accounts, :last_name, :string, limit: 50
    add_column :accounts, :date_of_birth, :date
    add_column :accounts, :estimated_lifespan, :date
    add_column :accounts, :user_agreement, :boolean
    add_column :accounts, :date_of_agreement, :datetime
  end
end
