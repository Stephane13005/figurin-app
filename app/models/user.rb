class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favourites, source: :figurine, dependent: :destroy
  has_many :figurines, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
