class AddUploadedAvatarToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uploaded_avatar, :string
  end
end
