class AddColorToDepartment < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :color, :string
  end
end
