class ClassesController < ApplicationController
	before_action :set_class, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @classes = SchoolClass.all
    add_breadcrumb "Classes"
    @class = SchoolClass.new
    @teachers = Employee.joins(:employee_position).where(
                :employee_positions => {:id => [2, 7]}
                ).order("employee_positions.name asc")

  end

  def new
    add_breadcrumb "Classes", classes_url
    add_breadcrumb "New Class"
    @class = SchoolClass.new
  end


  def show
    @class = SchoolClass.find_by_class_name(params[:class_name])
    @lesson = @class.lessons.build
    @class_subjects = @class.subjects
    @class_teachers = @class.teachers
    add_breadcrumb "Classes", classes_url
    add_breadcrumb "Details"
  end

  def class_details
    @class = SchoolClass.find(params[:id])
    @lesson = @class.lessons.build
    @class_subjects = @class.subjects
    @class_teachers = @class.teachers
    respond_to do |format|
      format.js
    end
  end

  def class_details_for_periods
    @class = SchoolClass.find(params[:id])
    @lesson = @class.lessons.build
    @week_days = WeekDay.all
    @periods = Period.all
    respond_to do |format|
      format.js
    end
  end

  def edit
    add_breadcrumb "Classes", classes_url
    add_breadcrumb "Edit Class"
  end

  # POST /batches
  # POST /batches.json
  def create
    @classes = SchoolClass.all
    @class = SchoolClass.new(class_params)
    add_breadcrumb "School Classes", classes_url
    add_breadcrumb "New Class"
    # respond_to do |format|
    if @class.save
      respond_to do |format|
        format.html { redirect_to classes_url }
        flash[:notice] = "Class was successfully created."
        format.json { head :no_content }
        format.js   { render :layout => false }
      end
      # format.html { redirect_to classes_url, notice: 'School Class was successfully created.' }
      # format.json { render :show, status: :created, location: @class }
    else
      respond_to do |format|
        format.html { render :new }
        flash[:alert] = @class.errors.full_messages.to_sentence
        # format.json { render json: @class.errors, status: :unprocessable_entity }
        format.json { head :no_content }
        format.js   { render :layout => false }
      end
      # end
    end
  end

  # PATCH/PUT /batches/1
  # PATCH/PUT /batches/1.json
  def update
    add_breadcrumb "Classes", classes_url
    add_breadcrumb "Edit"
    respond_to do |format|
      if @class.update(class_params)
        format.html { redirect_to classes_url, notice: 'Class was successfully updated.' }
        format.json { render :show, status: :ok, location: @class }
      else
        format.html { render :edit }
        flash[:alert] = @class.errors.full_messages.to_sentence
        format.json { render json: @class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @class.destroy
    respond_to do |format|
      format.html { redirect_to classes_url }
      flash.now[:notice] = "Class was successfully destroyed."
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def destroy_multiple
    SchoolClass.destroy(params[:class_destroy_id])
    flash[:notice] = "Classes were successfully destroyed."
    respond_to do |format|
      format.html { redirect_to classes_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class
      # begin
        @class = SchoolClass.find_by_class_name(params[:class_name])
      # rescue ActiveRecord::RecordNotFound
      #   redirect_to classes_url, :flash => { :error => "Record not found." }
      # end
    end

    def class_params
      params.require(:school_class).permit(:class_name, :short_name, :color)
    end
end

