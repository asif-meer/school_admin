# == Schema Information
#
# Table name: students
#
#  id                      :integer          not null, primary key
#  first_name              :string(255)
#  last_name               :string(255)
#  date_of_birth           :date
#  nic                     :string(255)
#  address                 :text
#  gender                  :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  avatar_file_name        :string(255)
#  avatar_content_type     :string(255)
#  avatar_file_size        :integer
#  avatar_updated_at       :datetime
#  general_register_number :integer
#  joining_date            :date
#  course_id               :integer
#  batch_id                :integer
#  roll_number             :string(255)
#  school_class_id         :integer
#

class Student < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :address, :gender, :joining_date, :date_of_birth,
                        :school_class_id, :session_id
  validates_uniqueness_of :general_register_number
  # validates_uniqueness_of :roll_number

  belongs_to :school_class
  belongs_to :session

  has_many :emergency_contacts, :dependent => :destroy
  accepts_nested_attributes_for :emergency_contacts

  belongs_to :course
  belongs_to :batch
  
  # scope :by_baches, -> { joins(:batches).where(:batches => {:batch_name =>}) }

  def self.by_baches(batch)
    joins(:batches).where(:batches => {:batch_name => batch})
  end



  # validates_associated :emergency_contacts

  # File Upload
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  attr_accessor :remove_avatar

  GENDER = ["Male", "Female"]

  before_create :increment_register_no

  # after_create :generate_roll_number

  def generate_roll_number
    unless self.class.last.nil?
      unless self.batch.students.blank?
        if self.batch.students.first.batch_id == self.batch_id
          self.roll_number = ("#{(self.batch.students.last.roll_number.to_i) + 1}-#{self.batch.batch_name}").to_s 
        end
      else
        self.roll_number = "1-"+self.batch.batch_name
      end
    else
      self.roll_number = "1-"+self.batch.batch_name unless self.batch.blank? 
    end
  end
  
  def increment_register_no
    self.general_register_number = (self.class.last.nil?) ? "1" : ((self.class.last.general_register_number.to_i) + 1).to_s
  end

  def to_s
    "#{self.first_name} #{self.last_name}"
  end
end
