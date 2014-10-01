# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  course_name  :string(255)
#  section_name :string(255)
#  code         :string(255)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    course_name "computer science"
    section_name "Morning"
    code "cs"
  end
end
