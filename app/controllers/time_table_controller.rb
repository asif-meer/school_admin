class TimeTableController < ApplicationController
	def index
		add_breadcrumb "Time Table"
		@week_days = WeekDay.all
		@class = SchoolClass.find_by_class_name(params[:search_class])
		# @classes = SchoolClass.first.periods.includes(:subject).where("week_day_id = ? AND level = ?", week_day, n
		@subjects = Subject.all
	end
end