class SchoolClassTeacher < AvtiveRecord::Base
	belongs_to :school_class
	belongs_to :employee, :class_name => "Employee", :foreign_key => :teacher_id
end