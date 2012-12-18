class PlacesController < ApplicationController

  def new
  	@place = Place.new
  end
  
  def create
    @place = Place.new(params[:place])
    @place.incomplete = true
    session[:is_place] = true
 #   redirect_to new_user_registration_path

 

  
      

  if @place.save
      session[:place_id] = @place.id
      redirect_to new_user_registration_path
    else
      @title = "Sign up"
     render 'new'
    end
  end

  def show
  	@invite = Invite.new
    @place = Place.find(session[:place_id])
    @invites = @place.invites.paginate(:page => params[:page])
    @title = @place.name
  end

  def dashboard
  end
end
