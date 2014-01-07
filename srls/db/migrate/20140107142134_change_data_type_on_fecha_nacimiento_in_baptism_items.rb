class ChangeDataTypeOnFechaNacimientoInBaptismItems < ActiveRecord::Migration
  def self.up
   change_column :baptism_items, :fecha_nacimiento, :date
  end

  def self.down
   change_column :baptism_items, :fecha_nacimiento, :string
  end
end
