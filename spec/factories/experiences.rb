# == Schema Information
#
# Table name: experiences
#
#  id              :integer          not null, primary key
#  company         :string(255)
#  position        :string(255)
#  from_date       :date
#  to_date         :date
#  teacher_id      :integer
#  still_attending :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

FactoryGirl.define do
  factory :experience do
    company "MyString"
position "MyString"
from_date "2015-02-20"
to_date "2015-02-20"
teacher_id 1
  end

end
