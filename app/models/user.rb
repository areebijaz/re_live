class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings, dependent: :destroy
  has_many :memories through: :bookings, dependent: :
  validates :username, :email, :first_name, :last_name, :phone_number, :address, :encrypted_password, presence: true
  validates :username, :email, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
