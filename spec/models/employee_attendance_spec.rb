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

require 'rails_helper'

RSpec.describe EmployeeAttendance, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
