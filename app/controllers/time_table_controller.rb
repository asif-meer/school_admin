class TimeTableController < ApplicationController
	def index
		add_breadcrumb "Time Table"
		@week_days = WeekDay.all
		@class = SchoolClass.find_by_class_name(params[:class])
		@subjects = Subject.all
	end

	def view
		@week_days = WeekDay.all
		@class = SchoolClass.find_by_class_name(params[:school_class_name])
		@subjects = Subject.all
    respond_to do |format|
      format.js
    end
	end

	def pdf_time_table
		@class = SchoolClass.find_by_class_name(params[:class_name])
		@week_days = WeekDay.all
		@subjects = Subject.all
		respond_to do |format|
			format.pdf
		end
	end

	def allocate_subjects
		add_breadcrumb "Time Table"
		@allocate_subject = Lesson.new
	end

	def update
		@class = SchoolClass.find_by_class_name(params[:class_name])
		@time_table = @class.lessons.find_by_period_id(params[:period_id])
		@time_table.update_attributes(time_table_params)
		
		if @time_table.save
			respond_to do |format|
        format.html { redirect_to :controller => 'time_table', :action => 'index', :class => @class.class_name }
        flash[:notice] = "Time Table for class #{@class.class_name} is updated."
        format.json { head :no_content }
        format.js   { render :layout => false }
	    end
		else
  		respond_to do |format|
        format.html { render :index }
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

	def remove_subject
		@class = SchoolClass.find_by_class_name(params[:class_name])
		@time_table = @class.lessons.find_by_period_id(params[:period_id])
		@time_table.update_attributes(:subject_id => "")
		if @time_table.save
			respond_to do |format|
        format.html { redirect_to :controller => 'time_table', :action => 'index', :class => @class.class_name }
        flash[:notice] = "Time Table for class #{@class.class_name} is updated."
        format.json { head :no_content }
        format.js   { render :layout => false }
	    end
		else
  		respond_to do |format|
        format.html { render :index }
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

	private

	def time_table_params
		params.require(:lesson).permit(:teacher_id, :school_class_id, :classroom_id, :period_id, :subject_id, :week_day_id)
	end
end