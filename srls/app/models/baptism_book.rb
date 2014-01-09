class BaptismBook < ActiveRecord::Base
  belongs_to :user
  has_many :baptism_items, :dependent => :destroy
  has_many :churches
  attr_accessible :codigo, :parroquia, :numero, :paginas, :partidas_pagina, :validado

  validates :codigo,
            :presence => {:message => "No puede estar vacio." },
            :uniqueness=> {:message => "Codigo ya existe." }
  validates :parroquia,
            :presence =>true
  validates :numero,
            :presence => {:message => "No puede estar vacio." },
            :numericality=> { only_integer: true}
  validates :paginas, :presence => { :message => "No puede estar vacio" },
            :numericality=> { only_integer: true}
  validates :partidas_pagina, :presence => { :message => "No puede estar vacio" },
            :numericality=> { only_integer: true}

 


  def nombre_tabla
    "Libro de Bautizo"
  end

  def correspondeACodigo(codigo)
    parametros = codigo.split(' ')
    
    parametros.each do |parametro|
      if self.codigo.downcase.include?(parametro.downcase)
        return true
      end
    end
    false
  end
  
  def correspondeAParroquia(parroquia)
    parametros = parroquia.split(' ')
    
    parametros.each do |parametro|
      if self.parroquia.downcase.include?(parametro.downcase)
        return true
      end
    end
    false
  end
  
  before_save do
    if self.id != nil && self.id != 0
      old = BaptismBook.find(self.id)
      ind = 0
      object = UpdatedDataTable.new
      object.source_table = "Libro de Bautizo"
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
