<<<<<<< HEAD
FactoryGirl.define do
  factory :school_class do
    name "MyString"
class_category_id 1
=======
# == Schema Information
#
# Table name: school_classes
#
#  id         :integer          not null, primary key
#  class_name :string(255)
#  short_name :string(255)
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :school_class do
     ""
short_name "MyString"
color "MyString"
employee_id 1
>>>>>>> bae63b7b592d41b65ae4748748d344198f45160e
  end

end
