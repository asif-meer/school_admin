# == Schema Information
#
# Table name: class_teachers
#
#  id              :integer          not null, primary key
#  school_class_id :integer
#  teacher_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class ClassTeacher < ActiveRecord::Base
	belongs_to :school_class
	belongs_to :teacher, :class_name => "Employee", :foreign_key => :teacher_id
end
