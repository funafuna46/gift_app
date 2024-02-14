class AddImageUrlToGifts < ActiveRecord::Migration[7.0]
  def change
    add_column :gifts, :image_url, :string
  end
end
