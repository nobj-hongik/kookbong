class CreateBarimages < ActiveRecord::Migration
  def change
    create_table :barimages do |t|
      t.belongs_to :user
      t.belongs_to :bar
      t.string :image
      t.timestamps null: false
    end
  end
end
