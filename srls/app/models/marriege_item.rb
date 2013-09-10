class MarriegeItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :marriege_book
  attr_accessible :bendicion_nupcial_de, :celebrante, :edad_esposa, :edad_esposo, :en_el, :en_fecha, :encargado, :fecha_bautizo_esposa, :fecha_bautizo_esposo, :fecha_matrimonio, :fecha_nacimiento_esposa, 
      :fecha_nacimiento_esposo, :feligreses, :lugar_nacimiento_esposa, :lugar_nacimiento_esposo, :madre_esposa, :madre_esposo, :nombre_esposa, :nombre_esposo, :num_partida_libreta_familiar, :numero, :oficialia,
      :padre_esposa, :padre_esposo, :parroquia_bautizo_esposa, :parroquia_bautizo_esposo, :primer_testigo, :profesion_esposa, :profesion_esposo, :segundo_testigo, :tipo_hijo_esposa, :tipo_hijo_esposo, 
      :tomo_libro, :validado
end
