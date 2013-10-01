class DeathRecordBook < ActiveRecord::Base
  belongs_to :user
  has_many :death_record_items, :dependent => :destroy
  attr_accessible :codigo, :numero, :paginas, :parroquia, :partidas_pagina, :validado
  validates :codigo, :uniqueness=>true
  validates :codigo, :numero, :parroquia, :presence=>true
  
  before_save do
    if self.id != nil && self.id != 0
      old = DeathRecordBook.find(self.id)
      ind = 0
      object = UpdatedDataTable.new
      object.source_table = "Libro de Defuncion"
      object.id_datum = self.id
      object.user = current_user
      object.save
      object.attributes.each do |datum|
        if datum.class.to_s != "Array"
          if datum != old.attributes[ind]
            data = UpdatedDataTableItem.new
            data.item = ind.to_s
            data.old_data = old.attributes[ind].to_s
            data.new_data = datum.to_s
          end
        end
        ind++
      end
    end
  end
end
