class AddPointToBars < ActiveRecord::Migration
  def change
       add_column :bars, :point1, :string 
       add_column :bars, :point2, :string        
  end
end
