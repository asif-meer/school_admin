# == Schema Information
#
# Table name: batches
#
#  id         :integer          not null, primary key
#  batch_name :string(255)
#  start_date :date
#  end_date   :date
#  course_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :batch do
    batch_name "MyString"
    start_date "2014-09-26"
    end_date "2014-09-26"
  end
end
