class EmployeesController < InheritedResources::Base
  def permitted_params
    params.permit(employee: [:first_name,:last_name, :gender,:employee_number,
                            :department_id,:employee_position_id,:job_title,:qualification,
                            :total_experience,:present_address,:perminent_address,:phone,:email])
  end
end