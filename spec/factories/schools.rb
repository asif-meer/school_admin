# == Schema Information
#
# Table name: schools
#
#  id             :integer          not null, primary key
#  school_name    :string(255)
#  school_address :text
#  school_email   :string(255)
#  school_phone   :string(255)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school do
    school_name "MyString"
    schoo_address "MyText"
    school_email "MyString"
    school_phone "MyString"
  end
end
