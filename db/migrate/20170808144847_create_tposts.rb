class CreateTposts < ActiveRecord::Migration
  def change
    create_table :tposts do |t|
      t.text :content
      t.string :image
      t.belongs_to  :user      
      t.timestamps null: false
    end
  end
end
