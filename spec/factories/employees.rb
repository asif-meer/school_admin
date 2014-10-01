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
