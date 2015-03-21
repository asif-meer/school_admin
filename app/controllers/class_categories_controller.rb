class ClassCategoriesController < InheritedResources::Base

  private

    def class_category_params
      params.require(:class_category).permit(:name)
    end
end

