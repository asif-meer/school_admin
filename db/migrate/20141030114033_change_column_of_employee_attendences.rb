class ChangeColumnOfEmployeeAttendences < ActiveRecord::Migration
  def change
    change_column :employee_attendences, :label, :integer, :default => 0
    EmployeeAttendence.update_all(:label => 0)
  end
end
