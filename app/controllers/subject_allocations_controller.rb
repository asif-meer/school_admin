class SubjectAllocationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_subject_allocation, only: [:show, :edit, :update, :destroy]
  # add_breadcrumb "Dashboard", :root_path, :options => { :title => "Home" }
  # GET /subject_allocations
  # GET /subject_allocations.json
  def index
    @subject_allocations = SubjectAllocation.all
    add_breadcrumb "Subjects Design", subjects_path
    add_breadcrumb "Subjects Allocation", subject_allocations_path
  end

  # GET /subject_allocations/1
  # GET /subject_allocations/1.json
  def show
    add_breadcrumb "Subjects Design", subjects_path, :title => "Back to the Index"
    add_breadcrumb "Subjects Allocation", subject_allocations_path
    add_breadcrumb "Details"
  end

  # GET /subject_allocations/new
  def new
    @subject_allocation = SubjectAllocation.new

    add_breadcrumb "Subjects Design", subjects_path, :title => "Back to the Index"
    add_breadcrumb "Subjects Allocation", subject_allocations_path
    add_breadcrumb "New Subject Allocation"
  end

  # GET /subject_allocations/1/edit
  def edit
    add_breadcrumb "Subjects Design", subjects_path, :title => "Back to the Index"
    add_breadcrumb "Subjects Allocation", subject_allocations_path
    add_breadcrumb "Edit Subject Allocation"
  end

  # POST /subject_allocations
  # POST /subject_allocations.json
  def create
    @subject_allocation = SubjectAllocation.new(subject_allocation_params)

    respond_to do |format|
      if @subject_allocation.save
        format.html { redirect_to subject_allocations_path, notice: 'Subject allocation was successfully created.' }
        format.json { render :show, status: :created, location: @subject_allocation }
      else
        format.html { render :new }
        format.json { render json: @subject_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_allocations/1
  # PATCH/PUT /subject_allocations/1.json
  def update
    respond_to do |format|
      if @subject_allocation.update(subject_allocation_params)
        format.html { redirect_to subject_allocations_path, notice: 'Subject allocation was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject_allocation }
      else
        format.html { render :edit }
        format.json { render json: @subject_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_allocations/1
  # DELETE /subject_allocations/1.json
  def destroy
    @subject_allocation.destroy
    respond_to do |format|
      flash.now[:notice] = "Subject allocation was successfully destroyed."
      format.html { redirect_to subject_allocations_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def destroy_multiple
    SubjectAllocation.destroy(params[:subject_allocation_destroy_id])
    flash[:notice] = "Subject Allocations were successfully destroyed."
    respond_to do |format|
      format.html { redirect_to subject_allocations_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_allocation
      begin
        @subject_allocation = SubjectAllocation.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to subject_allocations_url, :flash => { :error => "Request Page not found." }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_allocation_params
      params.require(:subject_allocation).permit(:course_id, :batch_id, :subject_id,:department_id, :employee_id)
    end
end
