class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :courses
  has_many :assessments, through: :courses
  #has_many :assignments, through: :courses, source: :assessments #allow us to refer to student.assignments
  #has_many :exams, through: :courses, source: :assessments #student.exams
end