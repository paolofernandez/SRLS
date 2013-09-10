class CreateDeathRecordItems < ActiveRecord::Migration
  def change
    create_table :death_record_items do |t|
      t.string :tomo_libro
      t.integer :numero
      t.string :nombre
      t.date :fecha
      t.integer :edad
      t.string :motivo_muerte
      t.string :tipo_hijo
      t.string :padre
      t.string :madre
      t.string :lugar_sepultura
      t.string :celebrante
      t.boolean :validado
      t.references :user
      t.references :death_record_book

      t.timestamps
    end
    add_index :death_record_items, :user_id
    add_index :death_record_items, :death_record_book_id
  end
end
