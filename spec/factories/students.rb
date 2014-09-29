# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    first_name "MyString"
    last_name "MyString"
    date_of_birth "2014-09-29"
    nic "MyString"
    address "MyText"
    gender "MyString"
  end
end
