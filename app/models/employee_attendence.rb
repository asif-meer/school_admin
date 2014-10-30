class EmployeeAttendence < ActiveRecord::Base
  belongs_to :employee

  enum :label => {:Absent => 0, :Present => 1}
end