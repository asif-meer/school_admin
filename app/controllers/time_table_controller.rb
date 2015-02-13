class TimeTableController < ApplicationController
	def index
		add_breadcrumb "Time Table"
		@week_days = WeekDay.all
		@class = SchoolClass.find_by_class_name(params[:search_class])
		@subjects = Subject.all
	end
end