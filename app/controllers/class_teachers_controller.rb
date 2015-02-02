class ClassTeachersController < ApplicationController
	def create
		@class_teachers = ClassTeacher.new(:school_class_id => params[:class_id], :teacher_id => params[:teacher_id])
		if @class_teachers.save
			flash[:notice] = "#{@class_teachers.teacher.to_s} is added to Class #{@class_teachers.school_class.class_name}"
			redirect_to @class_teachers.teacher
		else
			flash[:error] = "Something went wrong"
			redirect_to classes_employees_path
		end
	end
end