class AddSomeToUposts2 < ActiveRecord::Migration
  def change
    add_column :uposts, :comments_count, :integer    
  end
end
