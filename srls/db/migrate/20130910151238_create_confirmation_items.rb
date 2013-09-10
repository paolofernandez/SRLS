class CreateConfirmationItems < ActiveRecord::Migration
  def change
    create_table :confirmation_items do |t|
      t.integer :tomo_libro
      t.integer :numero
      t.string :nombre
      t.integer :edad
      t.string :padre
      t.string :madre
      t.string :padrino
      t.string :madrina
      t.string :parroquia_confirmacion
      t.date :fecha_confirmacion
      t.string :parroquia_bautizo
      t.date :fecha_bautizo
      t.string :celebrante
      t.boolean :validado
      t.references :user
      t.references :confirmation_book

      t.timestamps
    end
    add_index :confirmation_items, :user_id
    add_index :confirmation_items, :confirmation_book_id
  end
end
