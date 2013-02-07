class Ride < ActiveRecord::Base
  attr_accessible :description, :title, :user_id

  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :completed_rides
end
