class CoursesController < ApplicationController
  def index
    @courses = @current_user.courses
  end
  def new
  end
  def create
    @course = @current_user.courses.build params[:course]
    @course.save
    flash[:notice] = @course.nil? ? "#{@course.title} was not created." : "#{@course.title} was created."
    redirect_to courses_path
  end
  def show
    id = params[:id]
    @course = @current_user.courses.select {|c| c.id == id}
  end
  def destroy
    id = params[:id]
    @course = Course.destroy_by_id_and_student_id(id, session[:student_id])
    flash[:notice] = "#{@course.title} was deleted."
    redirect_to courses_path
  end
end
