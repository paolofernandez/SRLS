class AddToItems < ActiveRecord::Migration
  def change
    add_column :baptism_items, :pagina, :integer
    add_column :confirmation_items, :pagina, :integer
    add_column :death_record_items, :pagina, :integer
    add_column :marriege_items, :pagina, :integer
  end
end
