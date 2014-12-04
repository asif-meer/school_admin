class FeesParticularsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_fees_particular_id, only: [:show, :edit, :update, :destroy, :types]
  
  def new 
    @fees_particulars = FeesParticular.all
    @fees_category = FeesCategory.find(params[:id])
    @fees_particular = @fees_category.fees_particulars.build

    add_breadcrumb "Fees", fees_index_fees_categories_path
    add_breadcrumb "Fees Categories", fees_categories_url
    add_breadcrumb "Fees particular"
  end

  def edit
    add_breadcrumb "Fees", fees_index_fees_categories_path
    add_breadcrumb "Fees Categories", fees_categories_url
    add_breadcrumb "Fees Particulars", new_fees_particulars_url
    add_breadcrumb "Edit Fees particular"
  end

  def show
    add_breadcrumb "Fees", fees_index_fees_categories_path
    add_breadcrumb "Fees Categories", fees_categories_url
    add_breadcrumb "Fees Particulars", new_fees_particulars_url
    add_breadcrumb "Details"
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
    if @fees_particular.update_attributes(fees_particulars_params)
      redirect_to new_fees_particulars_path(@fees_particular.fees_category.id), notice: "Fees Particular Updated"
    else
      render :edit
    end
  end

  def types
    @fees_particular.batch_id = nil
    @fees_particular.roll_no = nil
    @fees_particular.save
  end

  def destroy
    @fees_particular.destroy
    flash[:alert] = "Particular Removed"
    redirect_to new_fees_particulars_path(@fees_particular.fees_category.id)
  end

  private

    def fees_particulars_params
      params.require(:fees_particular).permit(:name, :description, :fees_category_id, :all, :roll_no, :batch_id, :amount)
    end

    def set_fees_particular_id
      begin
        @fees_particular = FeesParticular.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to new_fees_particulars_url, :flash => { :error => "Request Page not found." }
      end
    end
end
