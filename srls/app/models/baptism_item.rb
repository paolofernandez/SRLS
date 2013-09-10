class BaptismItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :baptism_book
  attr_accessible :celebrante, :encargado, :fecha_bautizo, :fecha_nacimiento, :feligreses, :lugar_nacimiento,
       :madre, :madrina, :nombre, :numero, :oficialia, :padre, :padrino, :tipo_hijo, :tomo_libro, :pagina, :validado
  validates :celebrante, :encargado, :fecha_bautizo, :fecha_nacimiento, :lugar_nacimiento, :nombre, :numero,
       :tomo_libro, :pagina, :presence=>true
  validates :numero, :uniqueness => { :scope => :baptism_book_id }
  validates :fecha_nacimiento, :uniqueness => { :scope => :nombre, :scope => :baptism_book_id }
end
