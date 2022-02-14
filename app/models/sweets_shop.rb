class SweetsShop < ApplicationRecord

    attachment :image
    belongs_to :user,optional: true
    belongs_to :mypage,optional: true
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    enum status: {
     possible:0, impossible:1, partially_possible:2
    }

    validates :shop_name, presence: true
    validates :item_name, presence: true
    validates :genre, presence: true
    validates :price, presence: true
    validates :address, presence: true
    validates :body, presence: true
    validates :business_hours, presence: true
    validates :regular_holiday, presence: true
    validates :status, presence: true

end

