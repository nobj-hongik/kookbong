class CreateAdminposts < ActiveRecord::Migration
  def change
    create_table :adminposts do |t|
      t.string :image
      t.string :title
      t.text :content
      t.integer :category
      t.integer :comments_count
      t.belongs_to  :admin_user
      t.timestamps null: false
    end
  end
end
