class Mypage < ApplicationRecord
  
  attachment :image
  belongs_to :user
  has_many :sweets_shops, dependent: :destroy
  
end
