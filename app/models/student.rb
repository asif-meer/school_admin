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
  validates_presence_of :first_name, :last_name, :address, :nic, :gender,
                        :course_id, :batch_id, :joining_date, :date_of_birth
  validates_uniqueness_of :general_register_number

  has_many :emergency_contacts, :dependent => :destroy
  accepts_nested_attributes_for :emergency_contacts

  belongs_to :course
  belongs_to :batch
  
  # validates_associated :emergency_contacts

  # File Upload
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  attr_accessor :remove_avatar

  GENDER = ["Male", "Female"]

  before_create :increment_register_no

  def increment_register_no
      self.general_register_number = (self.class.last.nil?) ? "1000" : ((self.class.last.general_register_number.to_i) + 1).to_s
  end

  
end
