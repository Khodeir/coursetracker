class Authorization < ActiveRecord::Base
  belongs_to :student
  validates :provider, :uid, :presence => true
  attr_accessible :provider, :uid, :student_id
end
