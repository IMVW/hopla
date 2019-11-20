class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :manager, :boolean, default: :false
    add_column :users, :skills, :string, array: true
    add_column :users, :phone_number, :string
    add_column :users, :birthday, :date
  end
end
