class Gift < ApplicationRecord
  belongs_to :user
  belongs_to :gift_category
  belongs_to :recipient_category
  belongs_to :gift_card_template, foreign_key: 'design_id', inverse_of: :gifts

  validates :design_id, presence: true
  validates :recipient, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 20 }
  validates :public_status, presence: true
end
