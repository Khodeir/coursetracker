class ApplicationController < ActionController::Base
  before_filter :prepare_calendar_strips
  private 

  def prepare_calendar_strips(month=nil, year=nil, shown_month=nil)
  	month = params[:month] ? params[:month].to_i : nil
    year = params[:year] ? params[:year].to_i : nil 
  	@month =  month.nil? ? ((Time.zone || Time).now.month).to_i : month
  	@year = year.nil? ? ((Time.zone || Time).now.year).to_i : year
	@shown_month = shown_month.nil? ? Date.civil(@year, @month): shown_month
	@event_strips = current_student.assessments.event_strips_for_month(@shown_month)
  end
end
