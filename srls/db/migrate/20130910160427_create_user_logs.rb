class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
      t.datetime :entrada
      t.datetime :salida
      t.references :user

      t.timestamps
    end
    add_index :user_logs, :user_id
  end
end
