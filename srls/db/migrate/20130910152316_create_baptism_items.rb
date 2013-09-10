class CreateBaptismItems < ActiveRecord::Migration
  def change
    create_table :baptism_items do |t|
      t.integer :tomo_libro
      t.integer :numero
      t.string :nombre
      t.date :fecha_bautizo
      t.string :celebrante
      t.string :lugar_nacimiento
      t.string :fecha_nacimiento
      t.string :tipo_hijo
      t.string :padre
      t.string :madre
      t.string :feligreses
      t.string :padrino
      t.string :madrina
      t.string :oficialia
      t.string :encargado
      t.boolean :validado
      t.references :user
      t.references :baptism_book

      t.timestamps
    end
    add_index :baptism_items, :user_id
    add_index :baptism_items, :baptism_book_id
  end
end
