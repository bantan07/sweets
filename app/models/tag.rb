class Tag < ApplicationRecord
  has_many   :tag_relationships, dependent: :destroy
  has_many   :sweets_shops, through: :tag_relationships
  validates :name, presence: true
end
