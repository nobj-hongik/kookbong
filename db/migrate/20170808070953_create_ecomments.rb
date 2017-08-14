class CreateEcomments < ActiveRecord::Migration
  def change
    create_table :ecomments do |t|
      t.belongs_to :user
      t.belongs_to :epost
      t.text :content
      t.timestamps null: false
    end
  end
end
