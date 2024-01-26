class Gift < ApplicationRecord
  belongs_to :user
  belongs_to :gift_category
  belongs_to :recipient_category

  validates :design, presence: true
  validates :recipient, presence: true
  validates :content, presence: true, length: { maximum: 20 }
  validates :public_status, presence: true
end
