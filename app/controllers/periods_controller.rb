class PeriodsController < ApplicationController
	before_filter :set_period, only: [:show, :edit, :destroy, :update]

	def index
    add_breadcrumb "Periods"
		@periods = Period.all
		@period = Period.new
	end

	def new
		add_breadcrumb "Periods", periods_path
		add_breadcrumb "New"
		@period = Period.new
	end

	def create
		@periods = Period.all
		@period = Period.new(period_params)
		if @period.save
			@period.duration = @period.time_diff(@period.start_time, @period.end_time)
			@period.save
	      respond_to do |format|
	        format.html { redirect_to periods_url }
	        flash[:notice] = "Period was successfully created."
	        format.json { head :no_content }
	        format.js   { render :layout => false }
	      end
	    else
	      respond_to do |format|
	        format.html { render :index }
	        flash[:alert] = @period.errors.full_messages.to_sentence
	        format.json { head :no_content }
	        format.js   { render :layout => false }
	      end
	    end
	end

	def update
		add_breadcrumb "Periods", periods_path
		@period_edit = Period.find(params[:id])
		@period_new = Period.new
		@periods = Period.all
		@period_edit.update_attributes(period_params)
		if @period_edit.save
				@period_edit.duration = @period_edit.time_diff(@period_edit.start_time, @period_edit.end_time)
				@period_edit.save
	      respond_to do |format|
	        format.html { redirect_to periods_url }
	        flash[:notice] = "Period was successfully Updated."
	        format.json { head :no_content }
	        format.js   { render :layout => false }
	      end
	    else
	      respond_to do |format|
	        format.html { render :edit }
	        flash[:alert] = @period_edit.errors.full_messages.to_sentence
	        format.json { head :no_content }
	        format.js   { render :layout => false }
	      end
	    end
	end

	def edit
		add_breadcrumb "Periods", periods_path
		add_breadcrumb "Edit"
		@period_edit = Period.find(params[:id])
		respond_to do |format|
      format.html { render :edit }
      # flash[:notice] = "Edit #{@period.name} period"
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
	end

	def show
		add_breadcrumb "Show"
	end

	def destroy
		@period.destroy
		respond_to do |format|
      format.html { redirect_to periods_path }
      flash.now[:notice] = "Period was successfully destroyed."
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
	end

	def destroy_multiple
    Period.destroy(params[:period_destroy_id])
    flash[:notice] = "Periods were successfully destroyed."
    respond_to do |format|
      format.html { redirect_to periods_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

	private

	def set_period
		@period = Period.find(params[:id])
	end

	def period_params
		params.require(:period).permit(:name, :short, :end_time, :start_time, :duration)
	end
end