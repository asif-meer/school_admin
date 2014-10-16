class StudentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    # @TODO display students after the user select course and batch.
    @students = Student.all
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.emergency_contacts.destroy_all
    if @student.update_attributes(student_params)
      flash[:notice] = "Student Successfully Updated"
      redirect_to student_path(@student)
    else
      render :new
      flash[:alert] = @student.errors.full_messages.to_sentence
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  def remove_avatar
    @student = Student.find(params[:id])
    @student.avatar = nil
    @student.save
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :date_of_birth, :nic, :address, :gender, emergency_contacts_attributes: [:name, :phone, :relationship])
  end

end
