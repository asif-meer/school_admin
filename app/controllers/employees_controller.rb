class EmployeesController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :set_employee_id, only: [:show, :edit, :update, :destroy, :remove_avatar]
  def human_resources
    add_breadcrumb "Human Resources"
  end

  def index
    @teacher_position = EmployeePosition.find(2)
    @employees = Employee.all
    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees"
  end

  def new
    @employee = Employee.new
    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees", employees_path
    add_breadcrumb "New Employee"
  end

  def teacher_new
    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees", employees_path
    add_breadcrumb "New Teacher"
    @teacher = Employee.new
    @teacher_position = EmployeePosition.find(2)
  end

  def classes
    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees", employees_path
    add_breadcrumb "Classes"
    @teacher = Employee.find(params[:id])
    @classes = SchoolClass.all
    @classrooms = Classroom.all
  end

  def edit
    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees", employees_path
    add_breadcrumb "Edit Employee Informations"
  end

  def show
    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees", employees_path
    add_breadcrumb "Details"
    @teacher = Employee.find(params[:id])
  end

  def teacher_create
    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees", employees_path
    add_breadcrumb "New Teacher"
    @teacher_position = EmployeePosition.find(2)
    @teacher = @teacher_position.employees.build(employees_params)
    if @teacher.save
      flash[:notice] = "Teacher Created Successfully"
      redirect_to teacher_class_employees_path(@teacher)
    else
      flash[:notice] = @employee.errors.full_messages.to_sentence
      render action: 'teacher_new'
    end
  end

  def create
    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees", employees_path
    add_breadcrumb "New Employee"
    @employee = Employee.new(employees_params)
    # if @employee.save
    #   redirect_to @employee
    #   flash[:notice] = "Employee Created Successfully"

    # else
    #   redirect_to :back
    #   flash[:alert] = @employee.errors.full_messages.to_sentence
    # end
    respond_to do |format|
       if @employee.save
         format.html { redirect_to @employee, notice: 'Employee Created Successfully' }
         format.json { render action: 'show', status: :created, location: @employee }
         format.json { render json: @employee }
       else
         format.html { render action: 'new' }
         flash[:alert] = @employee.errors.full_messages.to_sentence
         format.json { render json: @employee.errors, status: :unprocessable_entity }
         format.json { render json: @employee.errors.full_messages, status: :unprocessable_entity }
       end
     end
  end

  def update
    add_breadcrumb "Human Resources", human_resources_employees_path
    add_breadcrumb "Employees", employees_path
    add_breadcrumb "Edit Employee Informations"
    # @employee.update_attributes(employees_params)
    # if @employee.save
    #   redirect_to @employee
    #   flash[:notice] = "Employee Updated Successfully"
    # else
    #   redirect_to :back
    #   flash[:alert] = @employee.errors.full_messages.to_sentence
    # end
    respond_to do |format|
       if @employee.update(employees_params)
         format.html { redirect_to @employee, notice: 'Employee Updated Successfully' }
         format.json { head :no_content }
         format.json { render json: @employee }
       else
         format.html { render action: 'edit' }
         flash[:alert] = @employee.errors.full_messages.to_sentence
         format.json { render json: @employee.errors, status: :unprocessable_entity }
         format.json { render json: @employee.errors.full_messages, status: :unprocessable_entity }
       end
     end
  end

  def destroy
    @employee.destroy
    flash[:alert] = "Employee Destroyed"
    redirect_to employees_path
  end

  def remove_avatar
    @employee.avatar = nil
    @employee.save
    redirect_to employee_path(@employee)
  end

  def destroy_multiple
    Employee.destroy(params[:employee_destroy_id])
    flash[:notice] = "Employees were successfully destroyed."
    respond_to do |format|
      format.html { redirect_to employees_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end
  
  private

  def set_employee_id
    begin
      @employee = Employee.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to employes_url, :flash => { :error => "Request Page not found." }
    end
  end

  def employees_params
    params.require(:employee).permit(:first_name, :last_name, :date_of_birth, :gender, :employee_number,
                                     :joining_date, :job_title, :qualification, :total_experience, :present_address,
                                     :perminent_address, :phone, :email, :department_id, :avatar)
  end
end
