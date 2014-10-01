# == Schema Information
#
# Table name: emergency_contacts
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  phone        :string(255)
#  relationship :string(255)
#  student_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :emergency_contact do
    name "MyString"
    phone "MyString"
    relationship "MyString"
  end
end
