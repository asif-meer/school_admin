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
