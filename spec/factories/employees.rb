# == Schema Information
#
# Table name: employees
#
#  id                   :integer          not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  date_of_birth        :date(255)
#  gender               :string(255)
#  employee_number      :string(255)
#  joining_date         :date
#  department_id        :integer
#  employee_position_id :integer
#  job_title            :string(255)
#  qualification        :string(255)
#  total_experience     :string(255)
#  present_address      :text
#  perminent_address    :text
#  phone                :string(255)
#  email                :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  avatar_file_name     :string(255)
#  avatar_content_type  :string(255)
#  avatar_file_size     :integer
#  avatar_updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    first_name "MyString"
    last_name "MyString"
    date_of_birth "MyString"
    gender "MyString"
    employee_number "MyString"
    joining_date "2014-10-01"
    department nil
    employee_position nil
    job_title "MyString"
    qualification "MyString"
    total_experience "MyString"
    present_address "MyText"
    perminent_address "MyText"
    phone "MyString"
    email "MyString"
  end
end
