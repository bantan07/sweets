class Like < ApplicationRecord

   belongs_to :user
   belongs_to :sweets_shop #, counter_cache: :likes_count


end
