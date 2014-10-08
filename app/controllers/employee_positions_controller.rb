class EmployeePositionsController < InheritedResources::Base
  def permitted_params
    params.permit(employee_position: [:name])
  end
end
