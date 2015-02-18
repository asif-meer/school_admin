class AdmissionController < ApplicationController
  before_filter :authenticate_user!

  def new
    @student = Student.new
    @student.emergency_contacts.build
    add_breadcrumb "Students", students_path
    add_breadcrumb "New Admission"
  end

  def update_course
    @course = Course.find(params[:course_id])
    @batches = @course.batches
    respond_to do |format|
      format.js
    end
  end
  
  def create
    add_breadcrumb "Students", students_path
    add_breadcrumb "New Admission"
    @session = Session.where("DATE() >= start_date AND DATE() <= end_date").first
    @student = @session.students.build(admission_params)
    respond_to do |format|
      # @student.roll_number = @student.generate_roll_number
      if @student.save
        format.html { redirect_to students_path, notice: 'Student Successfully Saved' }
        format.json { render :show, status: :created, location: @student }
      else
        # @course = @student.course
        # if @course
        #   @batches = @course.batches
        # end
        format.html { render :new }
        flash[:alert] = @student.errors.full_messages.to_sentence
        format.json { render json: @student.errors, status: :unprocessable_entity  }
        
      end
    end
  end

  private

  def admission_params
    params.require(:student).permit(:first_name, :last_name, :date_of_birth, :nic, 
                                    :address, :gender, :avatar, :school_class_id, 
                                    :joining_date, :general_register_number, :roll_number, :session_id, 
                                    emergency_contacts_attributes: [:name, :phone, :relationship])
  end
end