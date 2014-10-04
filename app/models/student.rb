# == Schema Information
#
# Table name: students
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  date_of_birth :date
#  nic           :string(255)
#  address       :text
#  gender        :string(1)
#  created_at    :datetime
#  updated_at    :datetime
#

class Student < ActiveRecord::Base
  has_many :emergency_contacts, :dependent => :destroy
  accepts_nested_attributes_for :emergency_contacts, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true
  # validates_associated :emergency_contacts

  # validates_presence_of :first_name, :last_name, :address, :nic
end
