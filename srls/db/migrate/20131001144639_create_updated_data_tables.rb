class CreateUpdatedDataTables < ActiveRecord::Migration
  def change
    create_table :updated_data_tables do |t|
      t.string :source_table
      t.integer :id_datum
      t.references :user

      t.timestamps
    end
    add_index :updated_data_tables, :user_id
  end
end
