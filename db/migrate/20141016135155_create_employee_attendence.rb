class CreateEmployeeAttendence < ActiveRecord::Migration
  def change
    create_table :employee_attendences do |t|
      t.references :employee_id
      t.date :month
      t.integer :label, :limit => 1
    end
  end
end
