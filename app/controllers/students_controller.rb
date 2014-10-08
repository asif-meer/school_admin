class StudentsController < ApplicationController
  def index
    # @TODO display students after the user select course and batch.
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end
end
