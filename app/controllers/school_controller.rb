class SchoolController < ApplicationController
  def update
    @user = User.find(current_user)
    @user.update_attributes(school_params)
    if @user.save
      redirect_to school_edit_path, notice: "Successfully Updated"
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  private

  def school_params
    params.require(:user).permit(:school_attributes => [:school_name, :school_address, :school_email, :school_phone])
  end
end