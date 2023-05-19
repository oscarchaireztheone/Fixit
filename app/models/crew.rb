class Crew < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :generate_auth_token
  def generate_auth_token
    loop do
      self.auth_token = SecureRandom.hex
      break unless Crew.exists?(auth_token: auth_token)
    end
    self.auth_token
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :assignable, polymorphic: true

end
