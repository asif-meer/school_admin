class SchoolClassesController < InheritedResources::Base
	before_action :set_school_class, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /batches
  # GET /batches.json
  def index
    @school_classes = SchoolClass.all
    add_breadcrumb "School Classes"
    @school_class = SchoolClass.new
    @teachers = Employee.joins(:employee_position).where(
                :employee_positions => {:id => [2, 7]}
                ).order("employee_positions.name asc")

  end

  # GET /batches/1
  # GET /batches/1.json
  def show
    add_breadcrumb "School Classes", school_classes_url
    add_breadcrumb "Details"
  end

  # POST /batches
  # POST /batches.json
  def create
    @school_classes = SchoolClass.all
    @school_class = SchoolClass.new(school_class_params)
    add_breadcrumb "School Classes", school_classes_url
    add_breadcrumb "New School Class"
    # respond_to do |format|
      if @school_class.save
        respond_to do |format|
          format.html { redirect_to school_classes_url }
          flash[:notice] = "School Class was successfully created."
          format.json { head :no_content }
          format.js   { render :layout => false }
        end
        # format.html { redirect_to school_classes_url, notice: 'School Class was successfully created.' }
        # format.json { render :show, status: :created, location: @school_class }
      else
        respond_to do |format|
          format.html { render :new }
          flash[:alert] = @school_class.errors.full_messages.to_sentence
          # format.json { render json: @school_class.errors, status: :unprocessable_entity }
          format.json { head :no_content }
          format.js   { render :layout => false }
        end
      # end
    end
  end

  # PATCH/PUT /batches/1
  # PATCH/PUT /batches/1.json
  def update
    add_breadcrumb "School Classes", school_classes_url
    add_breadcrumb "Edit"
    respond_to do |format|
      if @school_class.update(school_class_params)
        format.html { redirect_to @school_class, notice: 'School Class was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_class }
      else
        format.html { render :edit }
        flash[:alert] = @school_class.errors.full_messages.to_sentence
        format.json { render json: @school_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @school_class.destroy
    respond_to do |format|
      format.html { redirect_to school_classes_url }
      flash.now[:notice] = "School Class was successfully destroyed."
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def destroy_multiple
    @school_class.destroy(params[:school_class_destroy_id])
    flash[:notice] = "School Classes were successfully destroyed."
    respond_to do |format|
      format.html { redirect_to school_classes_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_class
      # begin
        @school_class = SchoolClass.find(params[:id])
      # rescue ActiveRecord::RecordNotFound
      #   redirect_to school_classes_url, :flash => { :error => "Record not found." }
      # end
    end

    def school_class_params
      params.require(:school_class).permit(:class_name, :short_name, :color)
    end
end

