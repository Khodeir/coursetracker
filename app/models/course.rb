class Course < ActiveRecord::Base
  has_many :assessments
  belongs_to :student
  attr_accessible :title, :name, :startDate, :endDate, :color
  @@colors = ['blue', 'green', 'pink', 'yellow', 'magenta']
  before_save :get_color

  def get_color
  	self.color= @@colors.unshift(@@colors.pop)[0]
  end
end
