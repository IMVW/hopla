class CreateJoinTableDepartmentsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :departments, :users do |t|
      t.index [:department_id, :user_id]
      t.index [:user_id, :department_id]
    end
  end
end
