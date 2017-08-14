class CreateEposts < ActiveRecord::Migration
  def change
    create_table :eposts do |t|
      t.string :title
      t.string :thumb
      t.text :content
      t.belongs_to  :user
      t.timestamps null: false
    end
  end
end
