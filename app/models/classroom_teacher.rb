class ClassroomTeacher < AvtiveRecord::Base
	belongs_to :classroom
	belongs_to :teacher, :class_name => "Employee", :foreign_key => :teacher_id
end