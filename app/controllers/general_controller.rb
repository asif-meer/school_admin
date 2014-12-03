class GeneralController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user_id, only: [:settings]


  def settings
    @user.school || @user.build_school
    add_breadcrumb "Settings"
  end

  def set_user_id
  	begin
			    @user = User.find(current_user)
		rescue ActiveRecord::RecordNotFound
			redirect_to school_edit_path, :flash => { :error => "Request Page not found." }
		end
  end
end