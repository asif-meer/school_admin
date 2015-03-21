# == Schema Information
#
# Table name: subject_allocations
#
#  id            :integer          not null, primary key
#  department_id :integer
#  employee_id   :integer
#  course_id     :integer
#  batch_id      :integer
#  subject_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class SubjectAllocation < ActiveRecord::Base
  belongs_to :department
  belongs_to :employee
  belongs_to :course
  belongs_to :batch
  belongs_to :subject
end
