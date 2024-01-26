class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :gift

  validates :user_id, uniqueness: { scope: :gift_id }
end
