class CreateChangeLogs < ActiveRecord::Migration
  def change
    create_table :change_logs do |t|
      t.datetime :hora
      t.string :tabla
      t.integer :id_objeto
      t.references :user

      t.timestamps
    end
    add_index :change_logs, :user_id
  end
end
