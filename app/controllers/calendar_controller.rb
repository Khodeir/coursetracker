class CalendarController < ApplicationController
  
  def index
    prepare_calendar_strips month, year, shown_month
  end
  
end
