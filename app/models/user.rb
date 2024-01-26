class User < ApplicationRecord
  has_many :gifts
  has_many :favorites, dependent: :destroy
  has_many :favorite_gifts, through: :favorites, source: :gift

  validates :name, presence: true, length: { maximum: 100 }
  validates :line_user_id, presence: true, uniqueness: true
end
