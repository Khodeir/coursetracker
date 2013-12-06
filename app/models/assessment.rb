class Assessment < ActiveRecord::Base
  belongs_to :course
  has_event_calendar
  attr_accessible :end_at, :name, :start_at, :weight, :type
  def color
  	self.course.color.value
  end
  def self.assignments
  	Assessment.find_all_by_type('Assignment')
  end
  def self.exams
  	Assessment.find_all_by_type('Exam')
  end
end
