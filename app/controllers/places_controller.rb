class PlacesController < ApplicationController
  def new
  	@place = Place.new
  end  
  def create
    @place = Place.new(params[:place])
    @place.incomplete = true
    session[:is_place] = true
    if @place.save
      session[:place_id] = @place.id
      redirect_to new_user_registration_path
    else
      @title = "Sign up"
     render 'new'
    end
  end
  def show
    @place = Place.find_by_id(params[:id]) 
    
    require 'net/http'
    require 'json'
    glinkpart="https://maps.googleapis.com/maps/api/place/"
    mykey='AIzaSyCku1n0YSNZeoPeW2s5ObdAUvo7MBT8TiY' 
    sensorkey="sensor=false&key=#{mykey}"
    @link="#{glinkpart}details/json?reference=#{@place.reference}&#{sensorkey}".html_safe
    uri = URI(@link)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production
    request = Net::HTTP::Get.new(uri.request_uri)
    res = http.request(request)
    hash = ActiveSupport::JSON.decode(res.body)
    @photo_refs=hash["result"].to_a[9][1].map{|element| element["photo_reference"]}
    @photo_refs.map! do|ref| 
      "#{glinkpart}photo?maxwidth=400&photoreference=#{ref}&sensor=false&key=#{mykey}&#{sensorkey}".html_safe
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def myplace
    
    @invite = Invite.new
    
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
