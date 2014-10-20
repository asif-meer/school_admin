class EmployeeAttendenceController < ApplicationController
  def index
    @attendences = EmployeeAttendence.all
    @employees = Employee.all
  end

  def edit_attendence
    # @attendence = EmployeeAttencence.find(params[:id])
    @employee = Employee.find(params[:id])
    if @employee.employee_attendences.present?
      @employee.employee_attendences 
    else
      @employee.employee_attendences.build
    end
  end

  def update_attendence
    @employee = Employee.find(params[:id])
    @employee.employee_attendences.destroy_all
    @employee.update_attributes(attendence_params)
    if @employee.save
      flash[:notice] = "Attencence Updated"
      redirect_to employee_attendence_index_path
    else
      flash[:notice] = "Try Again"
      render :edit
    end
  end


  def destroy
    # @attendence = Attencence.all
  end

  private

  def attendence_params
  	params.require(:employee).permit(:employee_attendences_attributes => [:date, :label] )
  end
end