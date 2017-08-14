class CreateUcomments < ActiveRecord::Migration
  def change
    create_table :ucomments do |t|
      t.belongs_to :user
      t.belongs_to :upost
      t.text :content
      t.timestamps null: false
    end
  end
end
