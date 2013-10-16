class Course < ActiveRecord::Base
  has_many :assignments
  belongs_to :student
  attr_accessible :title, :name, :startDate, :endDate
end
