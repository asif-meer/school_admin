class FeesCategoriesController < ApplicationController
  
  def index
    @fees_categories = FeesCategory.all
  end

  def new
    @fees_category = FeesCategory.new
  end

  def fees_particulars
    @fees_category = FeesCategory.find(params[:id])
    @fees_category.fees_particulars.build
  end

  def create_fees_particulars
    @fees_category = FeesCategory.find(params[:id])
    @fees_category.fees_particulars.build(fees_particulars_params)
    if @fees_particular
      redirect_to fees_categories_path, notice: "Particular Added"
    else
      reder :fees_particulars
    end
  end

  def edit
    @fees_category = FeesCategory.find(params[:id])
  end

  def show
    @fees_category = FeesCategory.find(params[:id])
  end

  def create
    @fees_category = FeesCategory.new(fees_categories_params)
    if @fees_category.save
      redirect_to fees_categories_path, notice: "Fees Category Added"
    else
      render :new
    end
  end

  def update
    @fees_category = FeesCategory.find(params[:id])
    if @fees_category.update_attributes(fees_categories_params)
      redirect_to fees_categories_path, notice: "Fees Category Updated"
    else
      render :edit
    end
  end

  def destroy
    @fees_category = FeesCategory.find(params[:id])
    @fees_category.destroy
  end

  private

    def fees_categories_params
      params.require(:fees_category).permit(:name, :description)
    end

    def fees_particulars_params
      params.require(:fees_particular).permit(:name, :description, :fees_category_id, :all, :roll_no, :batch_id, :amount)
    end
end
