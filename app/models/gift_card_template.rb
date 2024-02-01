class GiftCardTemplate < ApplicationRecord
  has_many :gifts, inverse_of: :gift_card_template

  validates :name, presence: true
  validates :image_url, presence: true
  validates :image_path, presence: true
end
