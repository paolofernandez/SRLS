class CreateUpdatedDataTableItems < ActiveRecord::Migration
  def change
    create_table :updated_data_table_items do |t|
      t.string :item
      t.string :old_data
      t.string :new_data
      t.references :updated_data_table

      t.timestamps
    end
    add_index :updated_data_table_items, :updated_data_table_id
  end
end
