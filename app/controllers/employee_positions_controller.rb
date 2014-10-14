class EmployeePositionsController < InheritedResources::Base
  before_filter :authenticate_user!
  
  def index
    @employee_positions = EmployeePosition.all
  end

  def new
    @employee_position = EmployeePosition.new
  end

  def edit
    @employee_position = EmployeePosition.find(params[:id])
  end

  def show
    @employee_position = EmployeePosition.find(params[:id])
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

  def employee_position_params
    params.require(:employee_position).permit(:name)
  end
end
