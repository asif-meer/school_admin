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

	# has_many :classroom_subjects, dependent: :destroy
 #  	has_many :subjects, :through => :classroom_subjects

 	has_many :lessons, foreign_key: :classroom_id
 	has_many :subjects, through: :lessons

	validates_presence_of :classroom_name, :short_name
	validates_uniqueness_of :classroom_name

	def self.find_or_create(attributes)
    	Classroom.where(attributes).first || Classroom.create(attributes)
	end
end
