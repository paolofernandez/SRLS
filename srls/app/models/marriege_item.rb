class MarriegeItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :marriege_book
  attr_accessible :bendicion_nupcial_de, :celebrante, :edad_esposa, :edad_esposo, :en_el, :en_fecha, :encargado,
      :fecha_bautizo_esposa, :fecha_bautizo_esposo, :fecha_matrimonio, :fecha_nacimiento_esposa, :pagina,
      :fecha_nacimiento_esposo, :feligreses, :lugar_nacimiento_esposa, :lugar_nacimiento_esposo, :madre_esposa,
      :madre_esposo, :nombre_esposa, :nombre_esposo, :num_partida_libreta_familiar, :numero, :oficialia,
      :padre_esposa,:padre_esposo, :parroquia_bautizo_esposa, :parroquia_bautizo_esposo, :primer_testigo,
      :profesion_esposa, :profesion_esposo, :segundo_testigo, :tipo_hijo_esposa, :tipo_hijo_esposo, :tomo_libro, :validado
  validates :celebrante, :edad_esposa, :edad_esposo, :encargado, :fecha_bautizo_esposo, :fecha_matrimonio,
      :fecha_nacimiento_esposa, :pagina, :fecha_nacimiento_esposo, :lugar_nacimiento_esposa, :lugar_nacimiento_esposo,
      :nombre_esposa, :nombre_esposo, :numero, :parroquia_bautizo_esposo, :tomo_libro, :presence=>true
  validates :numero, :uniqueness => { :scope => :marriege_book_id }
  validates :fecha_matrimonio, :uniqueness => { :scope => :nombre_esposo, :scope => :nombre_esposa }

  def nombre_tabla
    "Partida de Matrimonio"
  end

  def correspondeAnombre(nombre)
    parametros = nombre.split(' ')
    
    parametros.each do |parametro|
      if self.nombre_esposo.downcase.include?(parametro.downcase) || self.nombre_esposa.downcase.include?(parametro.downcase)
        return true
      end
    end
    false
  end
  
  before_save do
    if self.id != nil && self.id != 0
      old = MarriegeItem.find(self.id)
      ind = 0
      object = UpdatedDataTable.new
      object.source_table = "Partida de Matrimonio"
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
