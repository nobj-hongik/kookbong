class AddUpdateToUposts < ActiveRecord::Migration
  def change
    add_column :uposts, :category, :integer ,:default => 1  
  end
end
