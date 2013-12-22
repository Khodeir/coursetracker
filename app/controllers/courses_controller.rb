class CoursesController < ApplicationController
  def index
    @courses = current_student.courses
  end
  def new
  end
  def create
    @course = current_student.courses.build params[:course]
    @course.save
    flash[:notice] = @course.nil? ? "#{@course.title} was not created." : "#{@course.title} was created."
    redirect_to courses_path
  end
  def show
    id = params[:id]
    @course = current_student.courses.find(id)
  end
  def destroy
    id = params[:id]
    course = current_student.courses.find(id)
    course.destroy()
    flash[:notice] = "#{course.title} was deleted."
    redirect_to courses_path
  end
end
