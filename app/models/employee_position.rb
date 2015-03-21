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

  has_many :employees

  def to_s
    name
  end

  def self.find_or_create(attributes)
    EmployeePosition.where(attributes).first || EmployeePosition.create(attributes)
  end

end
