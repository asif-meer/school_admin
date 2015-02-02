# == Schema Information
#
# Table name: classrooms
#
#  id             :integer          not null, primary key
#  classroom_name :string(255)
#  short_name     :string(255)
#  shared         :boolean
#  color          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

FactoryGirl.define do
  factory :classroom do
    classroom_name "MyString"
short_name "MyString"
shared false
color "MyString"
  end

end
