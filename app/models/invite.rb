class Invite < ActiveRecord::Base
  attr_accessible :content, :place_id, :is_valid
  belongs_to :place
  has_one :event, :dependent => :destroy
end
