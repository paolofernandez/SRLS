class ConfirmationItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :confirmation_book
  attr_accessible :celebrante, :edad, :fecha_bautizo, :fecha_confirmacion, :madre, :madrina, :nombre, :numero, :padre, :padrino, :parroquia_bautizo, :parroquia_confirmacion, :tomo_libro, :validado
end
