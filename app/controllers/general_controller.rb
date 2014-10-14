class GeneralController < ApplicationController
  def settings
    @user = User.find(current_user)
    @user.school || @user.build_school
  end
end