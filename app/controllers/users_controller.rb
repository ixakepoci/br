class UsersController < ApplicationController
  def create

  end

  def update
  end

  def delete
  end

  def show
  end

  def badges
  end

  def get_invite
    @user=current_user
    @invite = Invite.first(:conditions => {:place_id => params[:place_id],:taken_by=>nil,:is_valid=>nil})
    @invite.taken_by = @user.id
    @invite.save
  end

  def dashboard    
    @user=current_user
    userLat=@user.lat
    userLng=@user.lng
    @places=Place.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
