class InvitesController < ApplicationController
  def new
  	@invite = Invite.new
  end
  def create
  	serial = (0...3).map{65.+(rand(26)).chr}.join
  	params[:num_invites][0].to_i.times { 
  		params[:invite] = serial+" "+ ('0'..'9').to_a.shuffle[0,4].join
  		@invite = Invite.new(:content => params[:invite], :place_id=>session[:place_id], :taken=>false)
      @invite.save
  	}
  	


  end

  def update
  end

  def index
  end

  def delete
  end
end
