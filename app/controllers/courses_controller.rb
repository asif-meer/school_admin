class CoursesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    add_breadcrumb "Course"
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    add_breadcrumb "Courses", courses_url
    add_breadcrumb "Details"
  end

  # GET /courses/new
  def new
    @course = Course.new
    add_breadcrumb "Courses", courses_url
    add_breadcrumb "New Course"
  end

  # GET /courses/1/edit
  def edit
    add_breadcrumb "Courses", courses_url
    add_breadcrumb "Edit Course"
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        flash[:alert] = @course.errors.full_messages.to_sentence
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      flash.now[:notice] = "Course Destroyed Successfully"
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def destroy_multiple
    Course.destroy(params[:course_destroy_id])
    flash[:notice] = "Courses were successfully destroyed."
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      begin
        @course = Course.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to courses_url, :flash => { :error => "Record not found." }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_name, :section_name, :code)
    end
end
