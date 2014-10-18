class EmployeeAttendenceController < ApplicationController
  def index
    @attendence = Attencence.all
    @employees = Employees.all

  end

  def edit
    @attendence = Attencence.find(params[:id])
  end

  def update
    @attendence = Attencence.all
  end

  def index
    @attendence = Attencence.all
  end

  def index
    @attendence = Attencence.all
  end

  def index
    @attendence = Attencence.all
  end

  def index
    @attendence = Attencence.all
  end

  private

  def attendence_params
  	params.require(:employee_attendece).permit(:month, :label)
  end
end