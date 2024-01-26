class RecipientCategory < ApplicationRecord
  has_many :gifts
  enum category_type: { family: 0, friend: 1, colleague: 2, other: 3 }
end
