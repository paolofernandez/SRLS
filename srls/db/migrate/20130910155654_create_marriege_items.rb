class CreateMarriegeItems < ActiveRecord::Migration
  def change
    create_table :marriege_items do |t|
      t.integer :tomo_libro
      t.integer :numero
      t.date :fecha_matrimonio
      t.string :celebrante
      t.string :nombre_esposo
      t.integer :edad_esposo
      t.string :profesion_esposo
      t.string :tipo_hijo_esposo
      t.string :padre_esposo
      t.string :madre_esposo
      t.string :lugar_nacimiento_esposo
      t.date :fecha_nacimiento_esposo
      t.string :parroquia_bautizo_esposo
      t.date :fecha_bautizo_esposo
      t.string :nombre_esposa
      t.integer :edad_esposa
      t.string :profesion_esposa
      t.string :tipo_hijo_esposa
      t.string :padre_esposa
      t.string :madre_esposa
      t.string :lugar_nacimiento_esposa
      t.date :fecha_nacimiento_esposa
      t.string :parroquia_bautizo_esposa
      t.date :fecha_bautizo_esposa
      t.string :feligreses
      t.string :primer_testigo
      t.string :segundo_testigo
      t.string :encargado
      t.string :oficialia
      t.integer :num_partida_libreta_familiar
      t.string :bendicion_nupcial_de
      t.string :en_el
      t.date :en_fecha
      t.boolean :validado
      t.references :user
      t.references :marriege_book

      t.timestamps
    end
    add_index :marriege_items, :user_id
    add_index :marriege_items, :marriege_book_id
  end
end
