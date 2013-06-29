class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  def after_sign_in_path_for(resource) 
    @user = User.find_by_email(params[:user][:email])
    if session[:is_place]!=true && @user.is_place!=true
    	users_dashboard_path  
    else 
      
    	myplace_path  
    end
  end 
end
