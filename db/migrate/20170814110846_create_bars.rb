class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.belongs_to :user
      t.string :image
      t.string :title 
      t.string :grip
      t.string :location    
      t.string :height
      t.string :review
      t.integer :score      
      t.timestamps null: false
    end
  end
end
