class AddBimageToUsers < ActiveRecord::Migration
  def change
        add_column :users, :bimage, :string
  end
end
