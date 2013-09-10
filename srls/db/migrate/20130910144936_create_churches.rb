class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.string :nombre
      t.string :zona
      t.string :vicaria
      t.string :codigo

      t.timestamps
    end
  end
end
