class ClassroomTeachersController < ApplicationController
	def create
		@classroom_teachers = ClassroomTeacher.new(:classroom_id => params[:classroom_id], :teacher_id => params[:teacher_id])
		if @classroom_teachers.save
			flash[:notice] = "#{@classroom_teachers.teacher.to_s} is added to Classroom #{@classroom_teachers.classroom.classroom_name}"
			redirect_to @classroom_teachers.teacher
		else
			flash[:error] = "Something went wrong"
			redirect_to classes_employees_path
		end
	end
end