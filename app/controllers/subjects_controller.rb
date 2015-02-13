class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # add_breadcrumb "Dashboard", :root_path, :options => { :title => "Home" }
  # GET /subjects
  # GET /subjects.json

  def index
    add_breadcrumb "Subjects", subjects_path, :title => "Back to the Index"
  end

  def list
    # @subjects = SubjectSearch.search_subjects(params)
    @subjects = Subject.all
    add_breadcrumb "Subjects", list_subjects_path, :title => "Back to the Index"
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @period = @subject.periods.build
    add_breadcrumb "Subjects", list_subjects_path
    add_breadcrumb "Details"
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
    add_breadcrumb "Subjects", list_subjects_path
    add_breadcrumb "New Subject"
  end

  # GET /subjects/1/edit
  def edit
    # @course_edit = @subject.course
    # @batches_edit = @course_edit.batches
    add_breadcrumb "Subjects", list_subjects_path
    add_breadcrumb "Edit Subject"
  end

  # POST /subjects
  # POST /subjects.json
  def create
    add_breadcrumb "Subjects", list_subjects_path
    add_breadcrumb "New Subject"

    @subject = Subject.new(subject_params)
    classroom = params[:subject][:classroom_ids]

    respond_to do |format|
      if @subject.save_with_classrooms(classroom)
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        # @course = @subject.course
        # if @course
        #   @batches = @course.batches
        # end
        flash[:alert] = @subject.errors.full_messages.to_sentence
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

  def update_course_for_search
    @course = Course.find(params[:course_id])
    @update_batches = @course.batches
    respond_to do |format|
      format.js
    end
  end
  
  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    add_breadcrumb "Subjects", list_subjects_path
    add_breadcrumb "Edit Subject"
    
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
      format.html { redirect_to list_subjects_url }
      flash.now[:notice] = "Subject was successfully destroyed."
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def destroy_multiple
    Subject.destroy(params[:subject_destroy_id])
    flash[:notice] = "Subjects were successfully destroyed."
    respond_to do |format|
      format.html { redirect_to list_subjects_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      begin
        @subject = Subject.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to list_subjects_url, :flash => { :error => "Request Page not found." }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:title, :short_name, :color, :classroom_ids => [])
    end
end
