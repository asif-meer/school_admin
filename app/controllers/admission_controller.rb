class AdmissionController < ApplicationController
  before_filter :authenticate_user!

  def new
    @student = Student.new
    2.times { @student.emergency_contacts.build }
  end

  def create
    @student = Student.new(admission_params)
    if @student.save
      flash[:notice] = "Student Successfully Saved"
      redirect_to students_path
    else
      render :new
      flash[:alert] = @student.errors.full_messages.to_sentence
    end
  end

  private

  def admission_params
    params.require(:student).permit(:first_name, :last_name, :date_of_birth, :nic, :address, :gender, :avatar, emergency_contacts_attributes: [:name, :phone, :relationship])
  end
end