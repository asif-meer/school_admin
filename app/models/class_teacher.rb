class ClassTeacher < ActiveRecord::Base
	belongs_to :school_class
	belongs_to :teacher, :class_name => "Employee", :foreign_key => :teacher_id
end