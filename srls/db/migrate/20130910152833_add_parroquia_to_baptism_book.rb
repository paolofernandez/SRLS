class AddParroquiaToBaptismBook < ActiveRecord::Migration
  def change
    add_column :baptism_books, :parroquia, :string
  end
end
