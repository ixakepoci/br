class InvitesController < ApplicationController
  def new
  	@invite = Invite.new
  end
  def create
    @user=current_user
  	serial = (0...3).map{65.+(rand(26)).chr}.join
  	params[:num_invites][0].to_i.times { 
  		params[:invite] = serial+" "+ ('0'..'9').to_a.shuffle[0,4].join
  		@invite = Invite.new(:content => params[:invite], :place_id=>@user[:place_id], :is_valid =>true)
      @invite.save
  	}
  	


  end

  def update
  end

  def index
    @invites = Invite.find_all_by_place_id(session[:place_id])

  end



  def delete
  end
end
