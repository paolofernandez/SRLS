class ConfirmationBook < ActiveRecord::Base
  belongs_to :user
  has_many :confirmation_items, :dependent => :destroy
  attr_accessible :codigo, :numero, :paginas, :partidas_pagina, :validado
  validates :codigo, :uniqueness=>true
  validates :codigo, :numero, :presence=>true
  
  before_save do
    if self.id != nil && self.id != 0
      old = ConfirmationBook.find(self.id)
      ind = 0
      object = UpdatedDataTable.new
      object.source_table = "Libro de Confirmacion"
      object.id_datum = self.id
      object.user = self.user
      object.save
      object.attributes.each do |datum|
        if datum.class.to_s != "Array"
          if datum != old.attributes[ind]
            data = UpdatedDataTableItem.new
            data.item = ind.to_s
            data.old_data = old.attributes[ind].to_s
            data.new_data = datum.to_s
            data.save
          end
        end
        ind+=1
      end
    end
  end
end
