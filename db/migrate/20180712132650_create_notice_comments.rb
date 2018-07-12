class CreateNoticeComments < ActiveRecord::Migration
  def change
    create_table :notice_comments do |t|
      t.belongs_to :user
      t.belongs_to :adminpost
      t.text :content
      t.timestamps null: false
    end
  end
end
