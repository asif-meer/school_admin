# == Schema Information
#
# Table name: fees_periods
#
#  id                 :integer          not null, primary key
#  fees_category_id   :integer
#  batch_id           :integer
#  start_date         :date
#  end_date           :date
#  due_date           :date
#  created_at         :datetime
#  updated_at         :datetime
#  fees_particular_id :integer
#

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
