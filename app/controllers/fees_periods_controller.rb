class FeesPeriodsController < ApplicationController

  def index
    @fees_periods = FeesPeriod.all
  end

  def new
    @fees_period = FeesPeriod.new
  end

  def update_fees_particulars
    @fees_category = FeesCategory.find(params[:fees_category_id])
    @fees_particulars = @fees_category.fees_particulars
    respond_to do |format|
      format.js
    end
  end

  def edit
    @fees_period = FeesPeriod.find(params[:id])
    @fees_category_edit = @fees_period.fees_category
    @fees_particulars_edit = @fees_category_edit.fees_particulars
  end

  def show
    @fees_period = FeesPeriod.find(params[:id])
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
    @fees_period = FeesPeriod.find(params[:id])
    if @fees_period.update_attributes(fees_periods_params)
      redirect_to @fees_period, notice: "Fees Period Updated"
    else
      flash[:error] = @fees_period.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @fees_period = FeesPeriod.find(params[:id])
    @fees_period.destroy
    redirect_to :back
  end

  private

  def fees_periods_params
    params.require(:fees_period).permit(:start_date, :end_date, :due_date, :fees_category_id, :fees_particular_id)
  end
end
