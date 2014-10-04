class DepartmentsController < InheritedResources::Base
  before_filter :authenticate_user!
  
  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def edit
    @department = Department.find(params[:id])
  end

  def show
    @department = Department.find(params[:id])
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
    @department = Department.find(params[:id])
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
    @department = Department.find(params[:id])
    @department.destroy
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
end
