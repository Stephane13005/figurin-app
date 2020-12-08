class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favourites, source: :figurine
  has_many :figurines, dependent: :destroy
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   # after_create :init_profile

   # def init_profile
   # 	Profile.create!(user_id: User.all.last.id, username: "Anonymous", photo: 'https://images.unsplash.com/photo-1602620502036-e52519d58d92?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1789&q=80')
   # end
end
