class CreateEmployeeAttendence < ActiveRecord::Migration
  def change
    create_table :employee_attendences do |t|
      t.references :employee
      t.date :date
      t.integer :label, :limit => 1

      t.timestamps
    end
  end
end
