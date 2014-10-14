# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fees_period do
    fees_category_id 1
    batch_id 1
    start_date "2014-10-14"
    end_date "2014-10-14"
    due_date "2014-10-14"
  end
end
