class CreateEpostImages < ActiveRecord::Migration
  def change
    create_table :epost_images do |t|
      t.string :alt
      t.string :hint
      t.string :file

      t.timestamps null: false
    end
  end
end
