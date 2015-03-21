class ClassroomTeachersController < ApplicationController
	def create
		@classrooms = Classroom.all
		@classroom_teacher = ClassroomTeacher.new(:classroom_id => params[:classroom_id], :teacher_id => params[:teacher_id])
		if @classroom_teacher.save
			respond_to do |format|
		      format.html { redirect_to teacher_class_employees_path(@classroom_teacher.teacher) }
		      flash[:notice] = "#{@classroom_teacher.teacher.to_s} is added to Classroom #{@classroom_teacher.classroom.classroom_name}"
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
		@classrooms = Classroom.all
		@classroom_teacher = ClassroomTeacher.find(params[:id])
		# cookies[:success] = 'yes'
		# cookies[:failed] = 'no'
		if @classroom_teacher.destroy
			respond_to do |format|
		      format.html { redirect_to teacher_class_employees_path(@classroom_teacher.teacher) }
		      flash[:notice] = "#{@classroom_teacher.teacher.to_s} is removed from Class #{@classroom_teacher.classroom.classroom_name}"
		      format.json { head :no_content }
		      format.js   { render :layout => false }
		    end
		else
			respond_to do |format|
		      format.html { redirect_to teacher_class_employees_path(@classroom_teacher.teacher) }
		      flash[:error] = "Something went wrong"
		      format.json { head :no_content }
		      format.js   { render :layout => false }
		    end
		end
	end
end