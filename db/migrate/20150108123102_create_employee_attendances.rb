class CreateEmployeeAttendances < ActiveRecord::Migration
  def change
    create_table :employee_attendances do |t|
      t.integer :employee_id
      t.date :attendance_date
      t.string :reason

      t.timestamps
    end
  end
end
