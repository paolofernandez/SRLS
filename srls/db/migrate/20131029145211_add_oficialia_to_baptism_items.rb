class AddOficialiaToBaptismItems < ActiveRecord::Migration
  def change
  	add_column :baptism_items, :oficialiaLibro, :integer
  	add_column :baptism_items, :oficialiaPartida, :integer
  	add_column :baptism_items, :oficialiaFs, :integer
  end
end
