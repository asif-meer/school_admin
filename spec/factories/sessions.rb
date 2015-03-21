<<<<<<< HEAD
FactoryGirl.define do
  factory :session do
    name "MyString"
from_date "2015-03-21"
to_date "MyString"
=======
# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :session do
    name "MyString"
start_date "2015-01-28"
end_date "2015-01-28"
>>>>>>> bae63b7b592d41b65ae4748748d344198f45160e
  end

end
