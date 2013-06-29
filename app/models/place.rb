class Place < ActiveRecord::Base
	belongs_to :user, :dependent => :destroy
	has_many :invites, :dependent => :destroy
	has_many :events, :dependent => :destroy
	attr_accessible :name, :formatted_address, :latlng, :reference, :unique_google_id, :url, :vicinity, :lat, :lng


end
