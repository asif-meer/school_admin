class SubjectsController < ApplicationController

  # GET action for /admission
  def new
    @student = Student.new
    # student admission form has two emergency contact
    2.times do |i|
      @emergency_contacts = @student.emergency_contacts.build
    end
  end

  # POST action for /admission
  def create
  end

end