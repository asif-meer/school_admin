class FeesCollectController < ApplicationController
	before_filter :authenticate_user!


	private

	def set_fees_collect_id
      begin
         @fees_collect = FeesCollect.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        # redirect_to fees_categories_url, :flash => { :error => "Request Page not found." }
      end
    end
end
