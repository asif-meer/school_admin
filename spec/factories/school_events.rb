# == Schema Information
#
# Table name: school_events
#
#  id          :integer          not null, primary key
#  Event_name  :string(255)
#  description :text
#  start_date  :date
#  end_date    :date
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school_event do
    Event_name "MyString"
    description "MyText"
    start_date "2014-10-08"
    end_date "2014-10-08"
  end
end
