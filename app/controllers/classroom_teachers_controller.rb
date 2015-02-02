class ClassroomTeachersController < ApplicationController
	def create
		@classroom_teachers = ClassroomTeacher.new(:classroom_id => params[:classroom_id], :teacher_id => params[:teacher_id])
		if @classroom_teachers.save
			respond_to do |format|
		      format.html { redirect_to teacher_class_employees_path(@teacher) }
		      flash[:notice] = "#{@classroom_teachers.teacher.to_s} is added to Classroom #{@classroom_teachers.classroom.classroom_name}"
		      format.json { head :no_content }
		      format.js   { render :layout => false }
		    end
		else
			respond_to do |format|
		      format.html { redirect_to teacher_class_employees_path(@teacher) }
		      flash[:error] = "Something went wrong"
		      format.json { head :no_content }
		      format.js   { render :layout => false }
		    end
		end
	end
end