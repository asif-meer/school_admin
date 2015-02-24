class TimeTableController < ApplicationController
	def index
		add_breadcrumb "Time Table"
		@week_days = WeekDay.all
		@class = SchoolClass.find_by_class_name(params[:search_class])
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
	end

	def allocate_subjects
		
	end
end