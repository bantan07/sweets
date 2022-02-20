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
    validates :prefectures, presence: true
    validates :address, presence: true
    validates :body, presence: true
    validates :start_time, presence: true
    validates :finish_time, presence: true
    validates :regular_holiday, presence: true
    validates :status, presence: true

    def save_tags(savesweets_shop_tags)
     savesweets_shop_tags.each do |new_name|
     sweets_shop_tag = Tag.find_or_create_by(name: new_name)
     self.tags << sweets_shop_tag
     end
    end

    def self.search(search)
      return SweetsShop.all unless search
      ss1 = SweetsShop.where(['shop_name LIKE ?', "%#{search}%"])
        .or(SweetsShop.where(['prefectures LIKE ?', "%#{search}%"]))
      #  .or(SweetsShop.all.includes(:tag).where(tag: ['name LIKE ?', "%#{search}%"]))
      ss2 = []
      search_tag = Tag.where(['name LIKE ?', "%#{search}%"])
      search_tag.each do |tag|
        tag.sweets_shops.each do |sweet_shop|
          ss2.push(sweet_shop)
        end
      end
      total_record = ss1 + ss2
      total_record.uniq
    end

    def self.sort(selection)
      case selection
      when 'new'
        return all.order(created_at: :DESC)
      when 'old'
        return all.order(created_at: :ASC)
      when 'likes'
        #
        #iine_ari = find(Like.group(:sweets_shop_id).order(Arel.sql('count(sweets_shop_id) desc')).pluck(:sweets_shop_id))
        #iine_nashi = SweetsShop.all - iine_ari
        #total_record = iine_ari + iine_nashi
        #return total_record
        return self.left_joins(:likes).group(:id).order(Arel.sql('count(sweets_shop_id) desc'))
        # return find(Like.group(:sweets_shop_id).order(Arel.sql('count(sweets_shop_id) desc')).pluck(:sweets_shop_id))
      when 'dislikes'
        return self.left_joins(:likes).group(:id).order(Arel.sql('count(sweets_shop_id) asc'))
        #return find(Like.group(:sweets_shop_id).order(Arel.sql('count(sweets_shop_id) asc')).pluck(:sweets_shop_id))
      end
    end
end
