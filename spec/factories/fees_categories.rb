# == Schema Information
#
# Table name: fees_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fees_category do
    name "MyString"
    description "MyText"
  end
end
