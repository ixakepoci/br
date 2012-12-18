class ApplicationController < ActionController::Base

  protect_from_forgery
  include SessionsHelper

  def after_sign_in_path_for(resource) 
    if session[:place_id] != nil
      @place = Place.find_by_id(session[:place_id])
      @place.incomplete = false
      @place.save
      places_dashboard_path
    else users_dashboard_path
    end
  end
end
