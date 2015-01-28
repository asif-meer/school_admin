# == Schema Information
#
# Table name: students
#
#  id                      :integer          not null, primary key
#  first_name              :string(255)
#  last_name               :string(255)
#  date_of_birth           :date
#  nic                     :string(255)
#  address                 :text
#  gender                  :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  avatar_file_name        :string(255)
#  avatar_content_type     :string(255)
#  avatar_file_size        :integer
#  avatar_updated_at       :datetime
#  general_register_number :integer
#  joining_date            :date
#  course_id               :integer
#  batch_id                :integer
#  roll_number             :string(255)
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
