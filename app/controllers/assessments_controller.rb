class AssessmentsController < ApplicationController
	before_filter :set_course
	def get_assessment
		@assessment=@course.assessments.find(params[:id])
	end
	def set_course
		@course = current_student.courses.find(params[:course_id])
	end
    def index
      @assessments = @course.assessments.find_all_by_type(self.type)
    end
	def new
	end
	def create
		assessment = @course.assessments.build course_params
		assessment.type = self.type
		assessment.save
		@course.save
		flash[:notice] = assessment.nil? ? "#{assessment.name} was not created." : "#{assessment.name} was created."
		redirect_to course_path(@course)
	end
	def show
		@assessments = [get_assessment]
	end
	def destroy
		get_assessment.destroy()
		flash[:notice] = "#{@assessment.title} was deleted."
		redirect_to courses_path
	end
  def course_params
    params.require(:course_assessment).permit(:name, :start_at, :end_at, :weight, :type, :belongs_to)
  end
end
