# == Schema Information
#
# Table name: employee_positions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class EmployeePosition < ActiveRecord::Base
  # validations
  validates_presence_of :name
end
