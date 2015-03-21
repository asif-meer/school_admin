# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :session do
    name "MyString"
    start_date "2015-01-28"
    end_date "2015-01-28"
  end
end
