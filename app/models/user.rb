class User < ApplicationRecord
  include Authenticable
  include TokenProcessor
  include Filterable

  validates :email, presence: true, email: true
  validate :validate_password_presence
  validate :validate_password_length

  before_destroy :destroy_token

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]
  #
  # Finds a user given email and password
  # note: valid password method is inside authenticable
  #
  def self.find_by_credentials(creds)
    user = self.find_by(email: creds[:email])
    user if user.present? && user.valid_password?(creds[:password])
  end

end
