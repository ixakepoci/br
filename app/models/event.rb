class Event < ActiveRecord::Base
  attr_accessible :event_end, :expanded_description, :name, :place_id, :short_description, :event_start
  belongs_to :place
end
