class PeriodsController < ApplicationController
	def new_period
		@subject = Subject.find(params[:subject_id])
		@period = @subject.periods.build
		add_breadcrumb "Subjects", list_subjects_path
		add_breadcrumb "#{@subject.title}", @subject
		add_breadcrumb "Assign Period"
	end

	def create_period
		@subject = Subject.find(params[:subject_id])
		@period = @subject.periods.build(periods_params)
		add_breadcrumb "Subjects", list_subjects_path
		add_breadcrumb "#{@subject.title}", @subject
		add_breadcrumb "Assign Period"
		if @period.save
			flash[:notice] = "Period Assigned"
			redirect_to @subject
		else
			flash[:alert] = @period.errors.full_messages.to_sentence
      render :new_period 
		end
	end

	private

	def periods_params
		params.require(:period).permit(:teacher_id, :school_class_id, :week_days => [])
	end
end