class GiftCardTemplate < ApplicationRecord
  validates :name, presence: true
  validates :image_url, presence: true
  validates :image_path, presence: true
end
