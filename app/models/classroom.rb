# == Schema Information
#
# Table name: classrooms
#
#  id             :integer          not null, primary key
#  classroom_name :string(255)
#  short_name     :string(255)
#  shared         :boolean
#  color          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Classroom < ActiveRecord::Base
	has_many :classroom_teachers
	has_many :teachers, :through => :classroom_teachers

	has_many :classroom_subjects, dependent: :destroy
  	has_many :subjects, :through => :classroom_subjects

	validates_presence_of :classroom_name, :short_name
end
