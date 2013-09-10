class CreateConfirmationBooks < ActiveRecord::Migration
  def change
    create_table :confirmation_books do |t|
      t.string :codigo
      t.integer :numero
      t.integer :paginas
      t.integer :partidas_pagina
      t.boolean :validado
      t.references :user

      t.timestamps
    end
    add_index :confirmation_books, :user_id
  end
end
