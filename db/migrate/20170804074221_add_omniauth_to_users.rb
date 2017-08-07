class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :avatar, :string
  end
end
