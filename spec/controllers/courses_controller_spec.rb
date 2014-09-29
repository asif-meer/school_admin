require 'spec_helper'

describe CoursesController do
  before do
    @user           = FactoryGirl.create(:user)
    @course          = FactoryGirl.create(:course)
    sign_in(@user)
  end

  describe "GET #index" do
    before { get :index }
    it "populates an array of courses" do
      assigns(:courses).should eq([@course])
    end 
    it "renders the :index view" do
      response.should render_template :index
    end 
  end

  describe "GET #new" do
    before { get :new }
    it { should respond_with :success }
    it { should render_template :new }
  end

  describe "GET #show" do
    before { get :show, id: @course.id }

    it { should respond_with :success }
    it { assigns(:course).id.should == @course.id }
    it { should render_template :show }
  end

  describe "POST #create" do

    context "with valid attributes" do
      it "creates a record with specific couse and redirects" do
        expect do
          post :create, course: FactoryGirl.attributes_for(:course)
        end.to  change(Course,:count).by(1)
        should redirect_to course_path(assigns(:course))
      end
    end

    context "with invalid attributes" do
      # it "doesn't create a record and renders template" do
      #   expect do
      #     post :create, course: FactoryGirl.attributes_for(:course,course_name: nil)
      #   end.to_not change(Course, :count).by(1)
      #   should render_template :new
      # end
    end
  end
end