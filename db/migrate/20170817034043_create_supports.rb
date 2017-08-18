class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.string :image
      t.string :title
      t.text :location
      t.text :content      
      t.belongs_to  :user
      t.timestamps null: false
    end
  end
end
