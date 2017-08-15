class AddColumnsToBar < ActiveRecord::Migration
  def change
       add_column :bars, :equip, :string    
       add_column :bars, :simplelocation, :string      
  end
end
