class StudentCategoriesController < InheritedResources::Base
  before_filter :authenticate_user!
  
  def index
    @student_categories = StudentCategory.all
    add_breadcrumb "Admissions", admissions_students_path
    add_breadcrumb "Student categories"
  end

  def new
    @student_category = StudentCategory.new
    add_breadcrumb "Student categories", student_categories_url
    add_breadcrumb "New Category"
  end

  def edit
    @student_category = StudentCategory.find(params[:id])
    add_breadcrumb "Student categories", student_categories_url
    add_breadcrumb "Edit Category"
  end

  def show
    @student_category = StudentCategory.find(params[:id])
    add_breadcrumb "Student categories", student_categories_url
    add_breadcrumb "Details"
  end

  def create
    @student_category = StudentCategory.new(student_catagory_params)
    if @student_category.save
      redirect_to @student_category
      flash[:notice] = "Student catagory Created Successfully"
    else
      render :new
      flash[:alert] = @student_category.errors.full_messages.to_sentence
    end
  end

  def update
    @student_category = StudentCategory.find(params[:id])
    @student_category.update_attributes(student_catagory_params)
    if @student_category.save
      redirect_to @student_category
      flash[:notice] = "Student catagory Updated Successfully"
    else
      render :edit
      flash[:alert] = @student_category.errors.full_messages.to_sentence
    end
  end

  def destroy
    @student_category = StudentCategory.find(params[:id])
    @student_category.destroy
  end

  private

  def student_catagory_params
    params.require(:student_category).permit(:name)
  end
end
