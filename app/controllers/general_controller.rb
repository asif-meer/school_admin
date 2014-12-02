class GeneralController < ApplicationController
  before_filter :authenticate_user!

  def settings
    @user = User.find(current_user)
    @user.school || @user.build_school
    add_breadcrumb "Settings"
  end
end