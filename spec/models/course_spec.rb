# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  course_name  :string(255)
#  section_name :string(255)
#  code         :string(255)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# require 'rails_helper'

# RSpec.describe Course, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

require 'spec_helper'

describe Course do
  # it { should belong_to(:user) }
  it { should validate_presence_of(:course_name) }
  it { should validate_presence_of(:code) }

  describe "validations" do
    describe "course_name" do
      before { @course = FactoryGirl.build(:it_course) }

      context "when course_name blank" do
        before { @course.course_name = "" }

        it "is invalid" do
          @course.should_not be_valid
        end

        it "adds the correct error message" do
          @course.valid?
          @course.errors.messages[:course_name].should include("can't be blank")
        end
      end 
    end
  end

end
