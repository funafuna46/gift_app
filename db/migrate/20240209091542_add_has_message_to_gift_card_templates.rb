class AddHasMessageToGiftCardTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :gift_card_templates, :has_message, :boolean, default: false
  end
end
