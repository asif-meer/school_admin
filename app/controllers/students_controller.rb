class StudentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    # @TODO display students after the user select course and batch.
    @students = Student.all
  end

  def edit
    @student = Student.find(params[:id])
    @courses = Course.all
    @batches_all = []
  end

  def show
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.emergency_contacts.destroy_all
    @student.update_attributes(student_params)
    if @student.save
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
    redirect_to student_path(@student)
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :date_of_birth, :nic, :address, :gender, :avatar, :course_id, :batch_id, :joining_date, :general_register_number, :_destroy, emergency_contacts_attributes: [:name, :phone, :relationship])
  end

end
