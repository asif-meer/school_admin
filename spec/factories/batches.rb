# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :batch do
    batch_name "MyString"
    start_date "2014-09-26"
    end_date "2014-09-26"
  end
end
