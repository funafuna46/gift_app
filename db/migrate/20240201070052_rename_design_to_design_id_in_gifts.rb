class RenameDesignToDesignIdInGifts < ActiveRecord::Migration[7.0]
  def change
    rename_column :gifts, :design, :design_id
  end
end
