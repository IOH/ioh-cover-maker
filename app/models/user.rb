class User < ActiveRecord::Base
  has_secure_password
  has_many :posters 

  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  validates :account_name,  presence: true
  validates :account_name,  uniqueness: { case_sensitive: false }
end
