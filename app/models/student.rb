class Student < ActiveRecord::Base
  has_many :emergency_contacts
  accepts_nested_attributes_for :emergency_contacts, reject_if: proc { |attributes| attributes['name'].blank? }
end
