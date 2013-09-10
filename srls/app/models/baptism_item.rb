class BaptismItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :baptism_book
  attr_accessible :celebrante, :encargado, :fecha_bautizo, :fecha_nacimiento, :feligreses, :lugar_nacimiento, :madre, :madrina, :nombre, :numero, :oficialia, :padre, :padrino, :tipo_hijo, 
      :tomo_libro, :validado
end
