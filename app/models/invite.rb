class Invite < ActiveRecord::Base
  attr_accessible :content, :place_id, :taken
  belongs_to :place
end
