# == Schema Information
#
# Table name: fees_particulars
#
#  id               :integer          not null, primary key
#  fees_category_id :integer
#  name             :string(255)
#  description      :text
#  all              :boolean          default(FALSE)
#  roll_no          :string(255)
#  batch_id         :integer
#  amount           :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fees_particular do
    fees_category nil
    name "MyString"
    description "MyText"
    all false
    roll_# "MyString"
    batch nil
    amount "MyString"
  end
end
