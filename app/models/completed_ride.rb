class CompletedRide < ActiveRecord::Base
  attr_accessible :ride_id, :user_id

  belongs_to :user
  belongs_to :ride
end
