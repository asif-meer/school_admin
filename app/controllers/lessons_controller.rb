class LessonsController < ApplicationController
	
	def new
		@subject = Subject.find(params[:subject_id])
		@lesson = @subject.lessons.build
		add_breadcrumb "Subjects", list_subjects_path
		add_breadcrumb "#{@subject.title}", @subject
		add_breadcrumb "Assign Lesson"
	end

	def create
		# @week_day = WeekDay.find_by_name(params[:week_day_name])
		# @subject = Subject.find(params[:subject_id])

		@class = SchoolClass.find(params[:school_class_id])
		@class_subjects = @class.subjects
    @class_teachers = @class.teachers
    @class_students = @class.students
		@lesson = @class.lessons.build(lessons_params)
		# @lesson.week_day_id = @week_day.id
		add_breadcrumb "Classes", list_subjects_path
		add_breadcrumb "Assign Lesson"
		if @lesson.save
			respond_to do |format|
		        format.html { redirect_to class_name_path(@class.class_name) }
		        flash[:notice] = "Lesson Assigned"
		        format.json { head :no_content }
		        format.js   { render :layout => false }
		    end
		else
  		respond_to do |format|
        format.html { render template: "/classes/show" }
        flash[:alert] =
      	content_tag :strong do
        	content_tag :ul do
	     			@lesson.errors.full_messages.map{|m| content_tag(:li, m)}.join("").html_safe
     			end
   			end
        format.json { render json: @class.errors, status: :unprocessable_entity }
        format.json { head :no_content }
        format.js   { render :layout => false }
      end
		end
	end

	def destroy
		@lesson = Lesson.find(params[:id])
		@subject = Subject.find_by_id(@lesson.subject.id)
		@lesson.destroy
		respond_to do |format|
	      format.html { redirect_to @subject }
	      flash.now[:notice] = "Lesson removed"
	      format.json { head :no_content }
	      format.js   { render :layout => false }
	    end
	end

	private

	def lessons_params
		params.require(:lesson).permit(:teacher_id, :school_class_id, :classroom_id, :period_id, :subject_id, :week_day_id)
	end
end