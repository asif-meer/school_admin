class EmployeesController < InheritedResources::Base
  before_filter :authenticate_user!
  
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def show
    @employee = Employee.find(params[:id])
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

  private

  def employees_params
    params.require(:employee).permit(:first_name, :last_name, :date_of_birth, :gender, :employee_number,
                                     :joining_date, :job_title, :qualification, :total_experience, :present_address,
                                     :perminent_address, :phone, :email, :department_id, :employee_position_id)
  end
end
