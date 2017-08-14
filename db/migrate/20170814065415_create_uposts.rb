class CreateUposts < ActiveRecord::Migration
  def change
    create_table :uposts do |t|
      t.string :image
      t.string :title
      t.text :content
      t.belongs_to  :user
      t.timestamps null: false
    end
  end
end
