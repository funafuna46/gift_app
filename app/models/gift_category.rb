class GiftCategory < ApplicationRecord
  has_many :gifts
  enum category_type: { template: 0, original: 1, ai_generated: 2 }
end
