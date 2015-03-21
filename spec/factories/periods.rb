# == Schema Information
#
# Table name: periods
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  short      :string(255)
#  start_time :time
#  end_time   :time
#  duration   :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :period do
    name "MyString"
short "MyString"
start_time "2015-02-13 21:47:01"
end_time "2015-02-13 21:47:01"
duration 1
  end

end
