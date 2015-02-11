class PeriodsController < ApplicationController
	def new
		@subject = Subject.find(params[:subject_id])
		@period = @subject.periods.build
		add_breadcrumb "Subjects", list_subjects_path
		add_breadcrumb "#{@subject.title}", @subject
		add_breadcrumb "Assign Period"
	end

	def create
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
      		render :new
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
		params.require(:period).permit(:teacher_id, :school_class_id, :level, :week_day_id)
	end
end