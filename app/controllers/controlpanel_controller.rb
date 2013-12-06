class ControlpanelController < ApplicationController
	before_filter :authenticate_student!
	def home
		@courses = current_student.courses
		prepare_calendar_strips
	end
end
