# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fees_particular do
    fees_category nil
    name "MyString"
    description "MyText"
    all false
    roll_# "MyString"
    batch nil
    amount "MyString"
  end
end
