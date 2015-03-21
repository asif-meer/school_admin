class StudentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_student_id, :only => [:show, :edit, :update, :destroy, :remove_avatar]


  def admissions
    add_breadcrumb "Students"
  end

  def index
    # @TODO display students after the user select course and batch.
    @students = Student.order(created_at: :desc)

    add_breadcrumb "Students", students_path
  end

  def edit
    # @course_edit = @student.course
    # @batches_edit = @course_edit.batches
    # @courses = Course.all
    # @batches_all = []

    add_breadcrumb "Students", students_path
    add_breadcrumb "Edit Student Information"
  end

  def show
    add_breadcrumb "Students", students_path
    add_breadcrumb "Details"
  end

  def update
    @student.emergency_contacts.destroy_all
    @student.update_attributes(student_params)
    if @student.save
      flash[:notice] = "Student Successfully Updated"
      redirect_to student_path(@student)
    else
      # @course = @student.course
      # if @course
      #   @batches = @course.batches
      # end
      render :new
      flash[:alert] = @student.errors.full_messages.to_sentence
    end
  end

  def destroy
    @student.destroy
    flash[:notice] = "Student was successfully destroyed."
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def remove_avatar
    @student.avatar = nil
    @student.save
    redirect_to student_path(@student)
  end

  def destroy_multiple
    Student.destroy(params[:student_destroy_id])
    flash[:notice] = "Students were successfully destroyed."
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :date_of_birth, :nic, :address, :gender, :avatar, :course_id, :batch_id, :joining_date, :general_register_number, :_destroy, emergency_contacts_attributes: [:name, :phone, :relationship])
  end

  def set_student_id
    begin
      @student = Student.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to students_url, :flash => { :error => "Request Page not found." }
    end
  end

end
