class Course < ActiveRecord::Base
  has_many :assessments
  has_many :assignments, source: :assessments
  has_many :exams, source: :assessments
  belongs_to :student
  belongs_to :color
end
