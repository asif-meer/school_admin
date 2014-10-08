class SubjectAllocationsController < ApplicationController
  before_action :set_subject_allocation, only: [:show, :edit, :update, :destroy]

  # GET /subject_allocations
  # GET /subject_allocations.json
  def index
    @subject_allocations = SubjectAllocation.all
  end

  # GET /subject_allocations/1
  # GET /subject_allocations/1.json
  def show
  end

  # GET /subject_allocations/new
  def new
    @subject_allocation = SubjectAllocation.new
  end

  # GET /subject_allocations/1/edit
  def edit
  end

  # POST /subject_allocations
  # POST /subject_allocations.json
  def create
    @subject_allocation = SubjectAllocation.new(subject_allocation_params)

    respond_to do |format|
      if @subject_allocation.save
        format.html { redirect_to @subject_allocation, notice: 'Subject allocation was successfully created.' }
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
        format.html { redirect_to @subject_allocation, notice: 'Subject allocation was successfully updated.' }
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
      format.html { redirect_to subject_allocations_url, notice: 'Subject allocation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_allocation
      @subject_allocation = SubjectAllocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_allocation_params
      params.require(:subject_allocation).permit(:course_id, :batch_id, :subject_id,:department_id, :employee_id)
    end
end
