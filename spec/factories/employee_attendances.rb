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

FactoryGirl.define do
  factory :employee_attendance do
    employee_id 1
attendance_date "2015-01-08"
reason "MyString"
  end

end
