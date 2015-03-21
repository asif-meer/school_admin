class ClassTeachersController < ApplicationController
	def create
		@classes = SchoolClass.all
		@class_teachers = ClassTeacher.new(:school_class_id => params[:class_id], :teacher_id => params[:teacher_id])
		# cookies[:success] = 'yes'
		# cookies[:failed] = 'no'
		if @class_teachers.save
			respond_to do |format|
		      format.html { redirect_to teacher_class_employees_path(@class_teachers.teacher) }
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

	def destroy
		@classes = SchoolClass.all
		@class_teacher = ClassTeacher.find(params[:id])
		# cookies[:success] = 'yes'
		# cookies[:failed] = 'no'
		if @class_teacher.destroy
			respond_to do |format|
		      format.html { redirect_to teacher_class_employees_path(@class_teacher.teacher) }
		      flash[:notice] = "#{@class_teacher.teacher.to_s} is removed from Class #{@class_teacher.school_class.class_name}"
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