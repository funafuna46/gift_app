class AddUniqueIndexToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :line_user_id, unique: true
  end
end
