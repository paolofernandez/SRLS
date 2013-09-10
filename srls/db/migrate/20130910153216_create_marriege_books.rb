class CreateMarriegeBooks < ActiveRecord::Migration
  def change
    create_table :marriege_books do |t|
      t.string :codigo
      t.integer :numero
      t.string :parroquia
      t.integer :paginas
      t.integer :partidas_pagina
      t.boolean :validado
      t.references :user

      t.timestamps
    end
    add_index :marriege_books, :user_id
  end
end
