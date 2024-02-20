class RecipientCategory < ApplicationRecord
  has_many :gifts
  enum category_type: { family: 0, friend: 1, colleague: 2, other: 3 }

  def translated_category_type
    I18n.t("enums.recipient_category.category_type.#{category_type}")
  end
end
