class Employee < ActiveRecord::Base
  belongs_to :department
  belongs_to :employee_position
end
