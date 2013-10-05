class Student < ActiveRecord::Base
  has_many :authorizations
  has_many :courses
  validates :name, :email, :presence => true
  attr_accessible :email, :name
end