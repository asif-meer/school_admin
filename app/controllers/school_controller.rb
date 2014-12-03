class SchoolController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user_id, only: [:update]
  def update
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

  def set_user_id
    begin
      @user = User.find(current_user)
    rescue ActiveRecord::RecordNotFound
      redirect_to school_edit_path, :flash => { :error => "Request Page not found." }
    end
  end
end