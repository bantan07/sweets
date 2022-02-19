class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image
  has_many :sweets_shops, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_sweets_shops, through: :likes, source: :sweets_shop
  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction,  length: { maximum: 50 }
end
