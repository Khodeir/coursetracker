class ApplicationController < ActionController::Base
  before_filter :set_current_user
  protected
  def set_current_user
    @current_user ||= Student.find_by_id(session[:student_id])
    redirect_to login_path and return unless @current_user
  end
end
