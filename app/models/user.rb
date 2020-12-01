class User < ApplicationRecord
  has_one :profile
  has_many :reviews
  has_many :favourites
  has_many :figurines
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
