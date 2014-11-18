class FeesParticularsController < ApplicationController

  def index
    @fees_particulars = FeesParticular.all
  end

  def new 
    @fees_particulars = FeesParticular.all
    @fees_category = FeesCategory.find(params[:id])
    @fees_particular = @fees_category.fees_particulars.build
  end

  def edit
    @fees_particular = FeesParticular.find(params[:id])
  end

  def show
    # @fees_category = FeesCategory.find(params[:id])
    @fees_particular = FeesParticular.find(params[:id])
  end

  def create
    @fees_category = FeesCategory.find(params[:id])
    @fees_particular = @fees_category.fees_particulars.build(fees_particulars_params)
    if @fees_particular.save
      redirect_to new_fees_particulars_path, notice: "Fees Particular Added"
    else
      render :new
    end
  end

  def update
    @fees_particular = FeesParticular.find(params[:id])
    if @fees_particular.update_attributes(fees_particulars_params)
      redirect_to new_fees_particulars_path(@fees_particular.fees_category.id), notice: "Fees Particular Updated"
    else
      render :edit
    end
  end

  def types
    @fees_particular = FeesParticular.find(params[:id])
    @fees_particular.batch_id = nil
    @fees_particular.roll_no = nil
    @fees_particular.save

    # render nothing: false
    # redirect_to new_fees_particulars_path(@fees_particular.fees_category.id) 
  end

  def destroy
    @fees_particular = FeesParticular.find(params[:id])
    @fees_particular.destroy
    flash[:alert] = "Particular Removed"
    redirect_to new_fees_particulars_path(@fees_particular.fees_category.id)
  end

  private

    def fees_particulars_params
      params.require(:fees_particular).permit(:name, :description, :fees_category_id, :all, :roll_no, :batch_id, :amount)
    end
end
