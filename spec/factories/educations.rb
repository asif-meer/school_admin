# == Schema Information
#
# Table name: educations
#
#  id              :integer          not null, primary key
#  institute_name  :string(255)
#  degree          :string(255)
#  start_date      :date
#  completion_date :date
#  still_attending :boolean
#  teacher_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

FactoryGirl.define do
  factory :education do
    institute_name "MyString"
degree "MyString"
start_date "2015-02-20"
completion_date "2015-02-20"
still_attending false
  end

end
