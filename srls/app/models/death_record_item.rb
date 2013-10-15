class DeathRecordItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :death_record_book
  attr_accessible :celebrante, :edad, :fecha, :lugar_sepultura, :madre, :motivo_muerte, :nombre, :numero, :padre,
       :tipo_hijo, :tomo_libro, :pagina, :validado
  validates :celebrante, :edad, :fecha, :motivo_muerte, :nombre, :numero, :pagina, :tomo_libro, :presence=>true
  validates :numero, :uniqueness => { :scope => :death_record_book_id }
  validates :fecha, :uniqueness => { :scope => :nombre }

  def nombre_tabla
    "Partida de Defuncion"
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
      old = DeathRecordItem.find(self.id)
      ind = 0
      object = UpdatedDataTable.new
      object.source_table = "Partida de Defuncion"
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