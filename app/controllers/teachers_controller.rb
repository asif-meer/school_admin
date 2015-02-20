class TeachersController < ApplicationController
	before_filter :authenticate_user!
  before_filter :set_teacher, only: [:show, :edit, :update, :destroy, :remove_avatar]

	def index
		add_breadcrumb "Teachers"
		@teacher_position = EmployeePosition.find_by_name("Teacher")
		@teachers = Employee.teachers
	end

	def new
		add_breadcrumb "Teachers", teachers_url
    add_breadcrumb "New Teacher"
    @teacher = Employee.teachers_position
    @teacher.educations.build
    @teacher.experiences.build
	end

	def edit
		add_breadcrumb "Teachers", teachers_url
    add_breadcrumb "Edit Teacher"
	end

	def show
		add_breadcrumb "Teachers", teachers_url
	end

	def create
    add_breadcrumb "Teachers", teachers_url
    add_breadcrumb "New Teacher"
    @teacher = Employee.teachers_position(teacher_params)
    if @teacher
      flash[:notice] = "Teacher Created Successfully"
      redirect_to teachers_path
    else
      flash[:alert] = @teacher.errors.full_messages.to_sentence
      render action: 'new'
    end
  end

	def update
		add_breadcrumb "Teachers", teachers_url
    add_breadcrumb "Edit Teacher"
    @teacher.update_attributes(teacher_params)
    if @teacher.save
      flash[:notice] = "Teacher was Updated Successfully"
      redirect_to teacher_path(@teacher)
    else
      flash[:notice] = @teacher.errors.full_messages.to_sentence
      render action: 'edit'
    end
	end

	def destroy
		@teacher.destroy
		respond_to do |format|
      format.html { redirect_to teachers_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
	end

	def destroy_multiple
    Employee.destroy(params[:teacher_destroy_id])
    flash[:notice] = "Teachers were successfully destroyed."
    respond_to do |format|
      format.html { redirect_to teachers_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

	def remove_avatar
    @teacher.avatar = nil
    @teacher.save
    redirect_to @teacher
  end

	private

	def set_teacher
		begin
      @teacher = Employee.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to teachers_url, :flash => { :error => "Request Page not found." }
    end
	end

	def teacher_params
		params.require(:employee).permit(:first_name, :last_name, :date_of_birth, :gender, :employee_number,
                                     :joining_date, :job_title, :qualification, :total_experience, :present_address,
                                     :perminent_address, :phone, :email, :department_id, :avatar, :employee_position_id,
                                     :educations_attributes => [:degree, :start_date, :completion_date, :institute_name,
                                      :still_attending],
                                     :experiences_attributes => [:company, :position, :to_date, 
                                      :from_date, :still_attending]
                                     )
	end
end