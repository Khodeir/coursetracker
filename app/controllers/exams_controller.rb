class ExamsController < AssessmentsController
  def type
    'Exam'
  end
  def index
    @assessments = @course.assessments.exams
  end

end
