class DeleteZonaAndCodigoFromChurch < ActiveRecord::Migration
  def change
  	remove_column :churches, :codigo
  	remove_column :churches, :zona
  end
end
