class User < ActiveRecord::Base
  attr_accessible :name, :email, :photo_blob, :password, :password_confirmation

  before_save { |user| user.email = email.downcase }

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  validates :password, length: { minimum: 5, too_short: "minimum 5 characters" }, if: :password_given?
  # add :if option to prevent checking for password on any modification to user
  # :if what?
  validates :password_confirmation, presence: true, if: :password_given?

  has_secure_password

  has_many :rides
  has_many :completed_rides

  def password_given?
    !self.password.nil?
  end

  def reset_token
    self.token = SecureRandom.urlsafe_base64
    self.save
  end

  def delete_token
    self.token = nil
  end
end
