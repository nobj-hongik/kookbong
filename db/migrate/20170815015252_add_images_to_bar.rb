class AddImagesToBar < ActiveRecord::Migration
  def change
       add_column :bars, :image1, :string    
       add_column :bars, :image2, :string   
       add_column :bars, :image3, :string   
       add_column :bars, :image4, :string   
       add_column :bars, :image5, :string   
       add_column :bars, :image6, :string   
       add_column :bars, :image7, :string          
  end
end
