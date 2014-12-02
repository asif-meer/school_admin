class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # add_breadcrumb "Dashboard", :root_path, :options => { :title => "Home" }
  # GET /subjects
  # GET /subjects.json

  def index
    add_breadcrumb "Subjects Design", subjects_path, :title => "Back to the Index"
  end

  def list
    @subjects = Subject.all
    add_breadcrumb "Subjects Design", subjects_path, :title => "Back to the Index"
    add_breadcrumb "Subjects", list_subjects_path, :title => "Back to the Index"
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    add_breadcrumb "Subjects Design", subjects_path, :title => "Back to the Index"
    add_breadcrumb "Subjects", list_subjects_path
    add_breadcrumb "Details"
  end

  # GET /subjects/new
  def new
    @subject = Subject.new

    add_breadcrumb "Subjects Design", subjects_path, :title => "Back to the Index"
    add_breadcrumb "Subjects", list_subjects_path
    add_breadcrumb "New Subject"
  end

  # GET /subjects/1/edit
  def edit
    @course_edit = @subject.course
    @batches_edit = @course_edit.batches

    add_breadcrumb "Subjects Design", subjects_path, :title => "Back to the Index"
    add_breadcrumb "Subjects", list_subjects_path
    add_breadcrumb "Edit Subject"
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_course
    @course = Course.find(params[:course_id])
    @batches = @course.batches
    respond_to do |format|
      format.js
    end
  end
  
  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to list_subjects_path, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:course_id, :batch_id, :subject_name)
    end
end
