# == Schema Information
#
# Table name: classroom_teachers
#
#  id           :integer          not null, primary key
#  classroom_id :integer
#  teacher_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ClassroomTeacher < ActiveRecord::Base
	belongs_to :classroom
	belongs_to :teacher, :class_name => "Employee", :foreign_key => :teacher_id
end
