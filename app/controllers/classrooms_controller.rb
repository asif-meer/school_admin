class ClassroomsController < ApplicationController
	before_filter :authenticate_user!
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @classrooms = Classroom.all
    @classroom = Classroom.new
    add_breadcrumb "Classrooms"
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    add_breadcrumb "Classrooms", classrooms_url
    add_breadcrumb "Details"
  end

  # GET /courses/new
  def new
    @classroom = Classroom.new
    add_breadcrumb "Classrooms", classrooms_url
    add_breadcrumb "New Classroom"
  end

  # GET /courses/1/edit
  def edit
    add_breadcrumb "Classrooms", classrooms_url
    add_breadcrumb "Edit Classroom"
  end

  # POST /courses
  # POST /courses.json
  def create
    @classrooms = Classroom.all
    @classroom = Classroom.new(classroom_params)
    # respond_to do |format|
      if @classroom.save
        respond_to do |format|
          format.html { redirect_to classrooms_url }
          flash[:notice] = "Classroom was successfully created."
          format.json { head :no_content }
          format.js   { render :layout => false }
        end
        # format.html { redirect_to classrooms_url, notice: 'Classroom was successfully created.' }
        # format.json { render :show, status: :created, location: @classroom }
      else
        respond_to do |format|
          format.html { render :new }
          flash[:alert] = @classroom.errors.full_messages.to_sentence
          # format.json { render json: @classroom.errors, status: :unprocessable_entity }
          format.json { head :no_content }
          format.js   { render :layout => false }
        end
      end
    # end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to classrooms_url, notice: 'Classroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @classroom }
      else
        format.html { render :edit }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @classroom.destroy
    @classrooms = Classroom.all
    respond_to do |format|
      format.html { redirect_to classrooms_url }
      flash.now[:notice] = "Classroom Destroyed Successfully"
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private

 		def set_classroom
 			@classroom = Classroom.find(params[:id])
 		end

    def classroom_params
      params.require(:classroom).permit(:classroom_name, :short_name, :shared, :color)
    end
end
