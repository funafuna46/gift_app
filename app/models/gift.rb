class Gift < ApplicationRecord
  belongs_to :user
  belongs_to :gift_category
  belongs_to :recipient_category
  belongs_to :gift_card_template, foreign_key: 'design_id', inverse_of: :gifts
  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user

  validates :design_id, presence: true
  validates :recipient, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 20 }
  validates :expiration_date, presence: true
  validates :public_status, inclusion: { in: [true, false] }

  def self.ransackable_attributes(auth_object = nil)
    # 検索可能な属性
    %w[title content recipient_category_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[favorited_by favorites gift_card_template gift_category recipient_category]
  end
end
