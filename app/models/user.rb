class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_secure_password

  validates_presence_of :account_name
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end

  belongs_to :role

  has_many :posters, :dependent => :destroy

  def admin?
    self.role.name == "Admin"
  end

  def editor?
    self.role.name == "Editor"
  end

  def regular?
    self.role.name == "Regular"
  end

  # before_create { generate_token(:auth_token) }

  # def generate_token(column)
  #   begin
  #     self[column] = SecureRandom.urlsafe_base64
  #   end while User.exists?(column => self[column])
  # end

  # validates :account_name,  presence: true
  # validates :account_name,  uniqueness: { case_sensitive: false }
end
