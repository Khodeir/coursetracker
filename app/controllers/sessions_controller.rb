class SessionsController < ApplicationController
  skip_before_filter :set_current_user
  def new
    
  end

  def create
    auth_hash = request.env['omniauth.auth']
    provider = auth_hash["provider"]
    uid = auth_hash["uid"]
    
    student = Authorization.find_by_provider_and_uid(provider, uid)

    if student
      student = student.student
      flash[:notice] = "Welcome back, #{student.name}! Thanks for logging in." 
    else
      student = Student.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
      student.authorizations.build :provider => provider, :uid => uid
      student.save
      flash[:notice] = "Thanks for signing up!"
    end
    
    session[:student_id] = student.id
    redirect_to courses_path
  end

  def failure
  end
  def destroy
    session.delete(:student_id)
    @current_user = nil
    flash[:notice] = "Logged out successfully."
    redirect_to '/home'
  end
end
