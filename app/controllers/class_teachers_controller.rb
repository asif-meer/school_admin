class ClassTeachersController < ApplicationController
	def create
		@class_teachers = ClassTeacher.new(:school_class_id => params[:class_id], :teacher_id => params[:teacher_id])
		# cookies[:success] = 'yes'
		# cookies[:failed] = 'no'
		if @class_teachers.save
			respond_to do |format|
	      format.html { redirect_to teacher_class_employees_path(@teacher) }
	      flash[:notice] = "#{@class_teachers.teacher.to_s} is added to Class #{@class_teachers.school_class.class_name}"
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