class StudentCategoriesController < InheritedResources::Base
  def permitted_params
    params.permit(student_category: [:name])
  end
end
