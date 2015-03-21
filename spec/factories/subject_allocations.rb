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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject_allocation do
    department nil
    employee nil
    course nil
    batch nil
    subject nil
  end
end
