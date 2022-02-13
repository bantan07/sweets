class Comment < ApplicationRecord
   belongs_to :user
   belongs_to :sweets_shop
end
