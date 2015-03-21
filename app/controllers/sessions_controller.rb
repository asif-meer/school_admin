class SessionsController < InheritedResources::Base

  private

    def session_params
      params.require(:session).permit(:name, :from_date, :to_date)
    end
end

