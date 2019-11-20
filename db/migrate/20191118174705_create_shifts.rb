class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :department, foreign_key: true
      t.references :user, foreign_key: true
      t.string :skills, array: true

      t.timestamps
    end
  end
end
