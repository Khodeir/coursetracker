class ControlpanelController < ApplicationController
	def home
		@courses = current_student.courses
		prepare_calendar_strips
	end
end
