# == Schema Information
#
# Table name: school_classes
#
#  id          :integer          not null, primary key
#  class_name  :string(255)
#  short_name  :string(255)
#  color       :string(255)
#  employee_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :school_class do
     ""
short_name "MyString"
color "MyString"
employee_id 1
  end

end
