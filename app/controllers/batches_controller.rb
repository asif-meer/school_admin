class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  # GET /batches
  # GET /batches.json
  def index
    @batches = Batch.all
    add_breadcrumb "Batches"
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
    add_breadcrumb "Batches", batches_url
    add_breadcrumb "Details"
    
  end

  # GET /batches/new
  def new
    @batch = Batch.new
    add_breadcrumb "Batches", batches_url
    add_breadcrumb "New Batch"
  end

  # GET /batches/1/edit
  def edit
    add_breadcrumb "Batches", batches_url
    add_breadcrumb "Edit Batch"
  end

  # POST /batches
  # POST /batches.json
  def create
    @batch = Batch.new(batch_params)

    respond_to do |format|
      if @batch.save
        format.html { redirect_to @batch, notice: 'Batch was successfully created.' }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1
  # PATCH/PUT /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to @batch, notice: 'Batch was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @batch.destroy
    respond_to do |format|
      format.html { redirect_to batches_url }
      flash.now[:notice] = "Batch was successfully destroyed."
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def destroy_multiple
    Batch.destroy(params[:batch_destroy_id])
    flash[:notice] = "Batches were successfully destroyed."
    respond_to do |format|
      format.html { redirect_to batches_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      begin
        @batch = Batch.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to batches_url, :flash => { :error => "Record not found." }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params.require(:batch).permit(:course_id, :batch_name, :start_date,:end_date)
    end
end
