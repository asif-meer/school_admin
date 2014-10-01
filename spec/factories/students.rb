# == Schema Information
#
# Table name: students
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  date_of_birth :date
#  nic           :string(255)
#  address       :text
#  gender        :string(1)
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    first_name "MyString"
    last_name "MyString"
    date_of_birth "2014-09-29"
    nic "MyString"
    address "MyText"
    gender "MyString"
  end
end
