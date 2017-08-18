class CreateBcomments < ActiveRecord::Migration
  def change
    create_table :bcomments do |t|
      t.belongs_to :user
      t.belongs_to :bar
      t.text :content
      t.integer :satisscore
      t.integer :equipscore
      t.timestamps null: false
    end
  end
end
