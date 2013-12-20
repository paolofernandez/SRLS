class AddClaveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :clave, :string
  end
end
