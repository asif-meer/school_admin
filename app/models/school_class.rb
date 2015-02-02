# == Schema Information
#
# Table name: school_classes
#
#  id          :integer          not null, primary key
#  class_name  :string(255)
#  short_name  :string(255)
#  color       :string(255)
#  employee_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class SchoolClass < ActiveRecord::Base
  has_many :schoolclass_teachers
  has_many :teachers, :through => :schoolclass_teachers
end
