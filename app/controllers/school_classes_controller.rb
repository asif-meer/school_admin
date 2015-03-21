class SchoolClassesController < InheritedResources::Base

  private

    def school_class_params
      params.require(:school_class).permit(:name, :class_category_id)
    end
end

