class DepartmentsController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :set_department_id, only: [:show, :edit, :update, :destroy]
  def index
    @departments = Department.all
    add_breadcrumb "Departments"
  end

  def new
    @department = Department.new
    add_breadcrumb "Departments", departments_path
    add_breadcrumb "New Department"
  end

  def edit
    add_breadcrumb "Departments", departments_path
    add_breadcrumb "Edit Department"
  end

  def show
    add_breadcrumb "Departments", departments_path
    add_breadcrumb "Details"
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to @department
      flash[:notice] = "Department Created Successfully"
    else
      render :new
      flash[:alert] = @department.errors.full_messages.to_sentence
    end
  end

  def update
    @department.update_attributes(department_params)
    if @department.save
      redirect_to @department
      flash[:notice] = "Department Updated Successfully"
    else
      render :edit
      flash[:alert] = @department.errors.full_messages.to_sentence
    end
  end

  def destroy
    @department.destroy
  end

  private

  def set_department_id
    begin
      @department = Department.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to courses_url, :flash => { :error => "Request Page not found." }
    end
  end

  def department_params
    params.require(:department).permit(:name)
  end
end
