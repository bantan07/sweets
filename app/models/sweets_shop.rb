class SweetsShop < ApplicationRecord

    attachment :image
    belongs_to :user, optional: true
    has_many  :tag_relationships, dependent: :destroy
    has_many  :tags, through: :tag_relationships
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    def like_user(user_id)
      likes.find_by(user_id: user_id)
    end
    enum status: {
     possible:0, impossible:1, partially_possible:2
    }

    validates :shop_name, presence: true
    validates :item_name, presence: true
    validates :genre, presence: true
    validates :price, presence: true
    validates :address, presence: true
    validates :body, presence: true
    validates :regular_holiday, presence: true
    validates :status, presence: true

    def save_tags(savesweets_shop_tags)
     savesweets_shop_tags.each do |new_name|
     sweets_shop_tag = Tag.find_or_create_by(name: new_name)
     self.tags << sweets_shop_tag
     end
    end

end

