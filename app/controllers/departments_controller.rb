class DepartmentsController < InheritedResources::Base

  def permitted_params
    params.permit(department: [:name])
  end
end
