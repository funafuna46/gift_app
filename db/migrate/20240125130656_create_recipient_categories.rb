class CreateRecipientCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :recipient_categories do |t|
      t.integer :category_type, null: false

      t.timestamps
    end
  end
end
