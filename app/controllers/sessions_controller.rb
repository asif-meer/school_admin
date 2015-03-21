class SessionsController < InheritedResources::Base
	before_filter :authenticate_user!
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @sessions = Session.all
    @session = Session.new
    add_breadcrumb "Session"
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    add_breadcrumb "Sessions", sessions_url
    add_breadcrumb "Details"
  end

  # GET /courses/new
  def new
    @session = Session.new
    add_breadcrumb "Sessions", sessions_url
    add_breadcrumb "New Session"
  end

  # GET /courses/1/edit
  def edit
    add_breadcrumb "Sessions", sessions_url
    add_breadcrumb "Edit Session"
  end

  # POST /courses
  # POST /courses.json
  def create
    @session = Session.new(session_params)

    respond_to do |format|
      if @session.save
        format.html { redirect_to @session, notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @session }
      else
        @sessions = Session.all
        format.html { render :index }
        flash[:alert] = @session.errors.full_messages.to_sentence
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @session.destroy

    respond_to do |format|
      format.html { redirect_to sessions_url }
      flash.now[:notice] = "Session Destroyed Successfully"
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private

 		def set_session
 			@session = Session.find(params[:id])
 		end

    def session_params
      params.require(:session).permit(:name, :start_date, :end_date)
    end
end

