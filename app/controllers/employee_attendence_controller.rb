class EmployeeAttendenceController < ApplicationController
  def index
    @attendences = EmployeeAttendence.all
    @employees = Employee.where(created_at: (Date.today.beginning_of_month)..Date.today.end_of_month)
    # @label = @employees.map{ |m| m.employee_attendences.select(:label)
    @employees.each do |emp|
      @employee = Employee.find(emp.id)
      if @employee.employee_attendences.present?
        @employee.employee_attendences 
      else
        @employee.employee_attendences.new
      end
    end
    
  end

  def edit_attendence
    @employee = Employee.find(params[:id])
    if @employee.employee_attendences.present?
      @employee.employee_attendences 
    else
      @employee.employee_attendences.build
    end
  end

  def attendence
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