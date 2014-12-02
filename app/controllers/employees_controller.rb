class EmployeesController < InheritedResources::Base
  before_filter :authenticate_user!
  
  def human_resources
    add_breadcrumb "Human Resources"
  end

  def index
    @employees = Employee.all
    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees"
  end

  def attendance
    
  end

  def new
    @employee = Employee.new

    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees", employees_path
    add_breadcrumb "New Employee"
  end

  def edit
    @employee = Employee.find(params[:id])

    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees", employees_path
    add_breadcrumb "Edit Employee Informations"
  end

  def show
    @employee = Employee.find(params[:id])

    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees", employees_path
    add_breadcrumb "Details"
  end

  def create
    @employee = Employee.new(employees_params)
    if @employee.save
      redirect_to @employee
      flash[:notice] = "Employee Created Successfully"
    else
      render :new
      flash[:alert] = @employee.errors.full_messages.to_sentence
    end
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update_attributes(employees_params)
    if @employee.save
      redirect_to @employee
      flash[:notice] = "Employee Updated Successfully"
    else
      render :edit
      flash[:alert] = @employee.errors.full_messages.to_sentence
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
  end

  def remove_avatar
    @employee = Employee.find(params[:id])
    @employee.avatar = nil
    @employee.save
    redirect_to employee_path(@employee)
  end
  private

  def employees_params
    params.require(:employee).permit(:first_name, :last_name, :date_of_birth, :gender, :employee_number,
                                     :joining_date, :job_title, :qualification, :total_experience, :present_address,
                                     :perminent_address, :phone, :email, :department_id, :employee_position_id, :avatar)
  end
end
