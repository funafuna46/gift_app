class CreateGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts do |t|
      t.string :design
      t.string :recipient
      t.string :content
      t.date :expiration_date
      t.date :send_date
      t.boolean :public_status
      t.references :user, null: false, foreign_key: true
      t.references :gift_category, null: false, foreign_key: true
      t.references :recipient_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end