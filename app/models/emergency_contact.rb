# == Schema Information
#
# Table name: emergency_contacts
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  phone        :string(255)
#  relationship :string(255)
#  student_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class EmergencyContact < ActiveRecord::Base
  belongs_to :student
  # validations
  validates_presence_of :name
  validates_presence_of :phone
  
end
