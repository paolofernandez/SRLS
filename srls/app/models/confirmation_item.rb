class ConfirmationItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :confirmation_book
  attr_accessible :celebrante, :edad, :fecha_bautizo, :fecha_confirmacion, :madre, :madrina, :nombre, :numero, :pagina,
      :padre, :padrino, :parroquia_bautizo, :parroquia_confirmacion, :tomo_libro, :validado
  validates :celebrante, :fecha_bautizo, :fecha_confirmacion, :nombre, :numero, :parroquia_bautizo, :pagina,
      :parroquia_confirmacion, :tomo_libro, :presence=>true
  validates :numero, :uniqueness => { :scope => :confirmation_book_id }
  validates :fecha_confirmacion, :uniqueness => { :scope => :nombre }
end