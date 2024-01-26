class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :line_user_id, unique: true
      t.string :avatar
      t.boolean :public_status

      t.timestamps
    end
  end
end
