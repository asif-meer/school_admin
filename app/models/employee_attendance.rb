# == Schema Information
#
# Table name: employee_attendances
#
#  id              :integer          not null, primary key
#  employee_id     :integer
#  attendance_date :date
#  reason          :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class EmployeeAttendance < ActiveRecord::Base
	
end
