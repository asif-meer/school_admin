class AdmissionController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new

    2.times { @student.emergency_contacts.build }
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(admission_params)
    if @student.save
      flash[:notice] = "Student Successfully Saved"
      redirect_to admission_index_path
    else
      flash[:alert] = @student.errors.full_messages.to_sentence
      render new
    end
  end

  def update
    @student = Student.find(params[:id])
    @student.emergency_contacts.destroy_all
    if @student.update_attributes(admission_params)
      flash[:notice] = "Student Successfully Updated"
      redirect_to admission_index_path
    else
      flash[:alert] = @student.errors.full_messages.to_sentence
      render new
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to admission_index_path
  end

  private

  def admission_params
    params.require(:student).permit(:first_name, :last_name, :date_of_birth, :nic, :address, :gender, emergency_contacts_attributes: [:name, :phone, :relationship])
  end
end