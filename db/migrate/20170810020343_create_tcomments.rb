class CreateTcomments < ActiveRecord::Migration
  def change
    create_table :tcomments do |t|
      t.belongs_to :user
      t.belongs_to :tpost
      t.text :content
      t.timestamps null: false
    end
  end
end
