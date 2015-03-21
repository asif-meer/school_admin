<<<<<<< HEAD
class SchoolClass < ActiveRecord::Base
=======
# == Schema Information
#
# Table name: school_classes
#
#  id         :integer          not null, primary key
#  class_name :string(255)
#  short_name :string(255)
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class SchoolClass < ActiveRecord::Base
  has_many :class_teachers
  has_many :teachers, :through => :class_teachers
  
  has_many :lessons
  has_many :teachers, :through => :lessons

  has_many :lessons
  has_many :subjects, :through => :lessons

  has_many :students
  
  validates_presence_of :class_name, :short_name
  validates_uniqueness_of :class_name

  def self.find_or_create(attributes)
    SchoolClass.where(attributes).first || SchoolClass.create(attributes)
  end
>>>>>>> bae63b7b592d41b65ae4748748d344198f45160e
end
