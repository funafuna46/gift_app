class AddImagePathToGiftCardTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :gift_card_templates, :image_path, :string
  end
end
