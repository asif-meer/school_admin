class PeriodsController < ApplicationController
	
	def new
		@subject = Subject.find(params[:subject_id])
		@period = @subject.periods.build
		add_breadcrumb "Subjects", list_subjects_path
		add_breadcrumb "#{@subject.title}", @subject
		add_breadcrumb "Assign Period"
	end

	def create
		@week_day = WeekDay.find_by_name(params[:week_day_name])
		@subject = Subject.find(params[:subject_id])
		@period = @subject.periods.build(periods_params)
		@period.week_day_id = @week_day.id
		add_breadcrumb "Subjects", list_subjects_path
		add_breadcrumb "#{@subject.title}", @subject
		add_breadcrumb "Assign Period"
		if @period.save
			respond_to do |format|
        format.html { redirect_to @subject }
        flash[:notice] = "Period Assigned"
        # format.json { head :no_content }
        # format.js   { render :layout => false }
      end
		else
  		respond_to do |format|
        format.html { render template: "/subjects/show" }
        flash[:alert] =
      	content_tag :strong do
        	content_tag :ul do
	     			@period.errors.full_messages.map{|m| content_tag(:li, m)}.join("").html_safe
     			end
   			end
        # format.json { render json: @school_class.errors, status: :unprocessable_entity }
        # format.json { head :no_content }
        # format.js   { render :layout => false }
      end
		end
	end

	def destroy
		@period = Period.find(params[:id])
		@subject = Subject.find_by_id(@period.subject.id)
		@period.destroy
		respond_to do |format|
      format.html { redirect_to @subject }
      flash.now[:notice] = "Period removed"
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
	end

	private

	def periods_params
		params.require(:period).permit(:teacher_id, :school_class_id, :level)
	end
end