class CreateValidators < ActiveRecord::Migration
  def change
    create_table :validators do |t|
      t.text :comentario
      t.boolean :valido, :default => false
      t.string :tabla
      t.integer :id_dato
      t.references :users

      t.timestamps
    end
    add_index :validators, :users_id
  end
end
