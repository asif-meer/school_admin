class SubjectAllocation < ActiveRecord::Base
  belongs_to :department
  belongs_to :employee
  belongs_to :course
  belongs_to :batch
  belongs_to :subject
end
