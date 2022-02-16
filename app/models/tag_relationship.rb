class TagRelationship < ApplicationRecord
  belongs_to :sweets_shop
  belongs_to :tag
end
