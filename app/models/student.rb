class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :courses
  has_many :assessments, through: :courses
  has_many :assignments, through: :courses, source: :assessments #allow us to refer to student.assignments
  has_many :exams, through: :courses, source: :assessments #student.exams
  attr_accessible :email, :name
end