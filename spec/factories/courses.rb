# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    course_name "computer science"
    section_name "Morning"
    code "cs"
  end
end
