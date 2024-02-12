class AddTitleToGifts < ActiveRecord::Migration[7.0]
  def change
    add_column :gifts, :title, :string
  end
end
