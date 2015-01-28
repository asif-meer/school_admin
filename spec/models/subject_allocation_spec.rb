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

require 'rails_helper'

RSpec.describe SubjectAllocation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
