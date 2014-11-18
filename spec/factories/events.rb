# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    level "MyString"
    title "MyString"
    details "MyString"
    occured_at "2014-11-17 17:39:39"
    user_id 1
    data1 1
    data2 "MyString"
    data3 "MyString"
  end
end
