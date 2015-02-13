# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  batch_id   :integer
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  short_name :string(255)
#  color      :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject do
    course_id 1
    batch_id 1
    subject_name "MyString"
  end
end
