class RemoveSomeFromAdminpost < ActiveRecord::Migration
  def change
    remove_column :adminposts, :category
  end
end
