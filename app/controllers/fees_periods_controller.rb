class FeesPeriodsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_fees_period_id, only: [:show, :edit, :update, :destroy]
  def index
    @fees_periods = FeesPeriod.all
    add_breadcrumb "Fees", fees_index_fees_categories_path
    add_breadcrumb "Fees Periods"
  end

  def new
    @fees_period = FeesPeriod.new
    add_breadcrumb "Fees Periods", fees_periods_path
    add_breadcrumb "New Fees Period"
  end

  def update_fees_particulars
    @fees_category = FeesCategory.find(params[:fees_category_id])
    @fees_particulars = @fees_category.fees_particulars
    respond_to do |format|
      format.js
    end
  end

  def edit
    @fees_category_edit = @fees_period.fees_category
    @fees_particulars_edit = @fees_category_edit.fees_particulars
    add_breadcrumb "Fees Periods", fees_periods_path
    add_breadcrumb "Edit Fees Period"
  end

  def show
    add_breadcrumb "Fees Periods", fees_periods_path
    add_breadcrumb "Details"
  end

  def create
    @fees_period = FeesPeriod.new(fees_periods_params)
    if @fees_period.save
      redirect_to fees_periods_path, notice: "Fees Period Saved"
    else
      flash[:error] = @fees_period.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @fees_period.update_attributes(fees_periods_params)
      redirect_to @fees_period, notice: "Fees Period Updated"
    else
      flash[:error] = @fees_period.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @fees_period.destroy
    redirect_to :back
  end

  private

  def fees_periods_params
    params.require(:fees_period).permit(:start_date, :end_date, :due_date, :fees_category_id, :fees_particular_id)
  end

  def set_fees_period_id
    begin
      @fees_period = FeesPeriod.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to fees_periods_url, :flash => { :error => "Request Page not found." }
    end
  end
end
