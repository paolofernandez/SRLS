class BaptismItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :baptism_book
  attr_accessible :celebrante, :encargado, :fecha_bautizo, :fecha_nacimiento, :feligreses, :lugar_nacimiento,
       :madre, :madrina, :nombre, :numero, :oficialia, :padre, :padrino, :tipo_hijo, :tomo_libro, :pagina, :validado
  validates :celebrante, :encargado, :fecha_bautizo, :fecha_nacimiento, :nombre, :numero,
       :tomo_libro, :pagina, :presence=>true
  validates :numero, :uniqueness => { :scope => :baptism_book_id }
  validates :fecha_nacimiento, :uniqueness => { :scope => :nombre }#, :scope => :baptism_book_id }
  
  def nombre_tabla
    "Partida de Bautizo"
  end

  def correspondeAnombre(nombre)
    parametros = nombre.split(' ')
    
    parametros.each do |parametro|
      if self.nombre.downcase.include?(parametro.downcase)
        return true
      end
    end
    false
  end

  before_save do
    if self.id != nil && self.id != 0
      old = BaptismItem.find(self.id)
      ind = 0
      object = UpdatedDataTable.new
      object.source_table = "Partida de Bautizo"
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
