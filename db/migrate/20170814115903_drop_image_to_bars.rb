class DropImageToBars < ActiveRecord::Migration
  def change
    remove_column :bars, :image
  end
end
