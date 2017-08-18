class CreateScomments < ActiveRecord::Migration
  def change
    create_table :scomments do |t|
      t.belongs_to :user
      t.belongs_to :support
      t.text :content
      t.timestamps null: false
    end
  end
end
