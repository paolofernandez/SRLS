class MarriegeBook < ActiveRecord::Base
  belongs_to :user
  has_many :marriege_items
  attr_accessible :codigo, :numero, :paginas, :parroquia, :partidas_pagina, :validado
end
