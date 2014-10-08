# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school_event do
    Event_name "MyString"
    description "MyText"
    start_date "2014-10-08"
    end_date "2014-10-08"
  end
end
