class User < ActiveRecord::Base
  attr_accessible :name, :email, :photo_blob, :password, :password_confirmation

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, on: :create
  validates :password, length: { minimum: 5, too_short: "minimum 5 characters" }
  # add :if option to prevent checking for password on any modification to user
  # :if what?

  has_secure_password

  has_many :rides
  has_many :completed_rides

end
