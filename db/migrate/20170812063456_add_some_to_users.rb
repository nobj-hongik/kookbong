class AddSomeToUsers < ActiveRecord::Migration
  def change
       add_column :users, :fb, :string
       add_column :users, :insta, :string 
       add_column :users, :fbcheck, :integer     
       add_column :users, :instacheck, :integer          
  end
end
