class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :jwt_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, jwt_revocation_strategy: JwtDenylist

  has_many :notifications
end
