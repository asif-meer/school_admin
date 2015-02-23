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
		# respond_to do |format|
  #     # format.html { redirect_to classes_url }
  #     format.json { head :no_content }
  #     format.js   { render :layout => false }
  #   end
    respond_to do |format|
      format.js
    end
	end
end