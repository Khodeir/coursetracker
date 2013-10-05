class Course < ActiveRecord::Base
  #has_many :assessments
  belongs_to :student
  attr_accessible :title, :name, :startDate, :endDate
end
