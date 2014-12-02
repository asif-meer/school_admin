class EmployeePositionsController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :set_employee_position_id, only: [:show, :edit, :update, :destroy]
  
  def index
    @employee_positions = EmployeePosition.all
    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employee Positions"
  end

  def new
    @employee_position = EmployeePosition.new

    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employee Positions", employee_positions_path
    add_breadcrumb "New Employee Position"
  end

  def edit
    @employee_position = EmployeePosition.find(params[:id])

    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employee Positions", employee_positions_path
    add_breadcrumb "Edit Employee Position"
  end

  def show
    @employee_position = EmployeePosition.find(params[:id])

    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employee Positions", employee_positions_path
    add_breadcrumb "Details"
  end

  def create
    @employee_position = EmployeePosition.new(employee_position_params)
    if @employee_position.save
      redirect_to @employee_position
      flash[:notice] = "Employee Position Created Successfully"
    else
      render :new
      flash[:alert] = @employee_position.errors.full_messages.to_sentence
    end
  end

  def update
    @employee_position = EmployeePosition.find(params[:id])
    @employee_position.update_attributes(employee_position_params)
    if @employee_position.save
      redirect_to @employee_position
      flash[:notice] = "Employee Position Updated Successfully"
    else
      render :edit
      flash[:alert] = @employee_position.errors.full_messages.to_sentence
    end
  end

  def destroy
    @employee_position = EmployeePosition.find(params[:id])
    @employee_position.destroy
  end

  private

  def set_employee_position_id
    @employee_position = EmployeePosition.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to employee_positions_path, :flash => { :error => "Request Page not found." }
  end

  def employee_position_params
    params.require(:employee_position).permit(:name)
  end
end
