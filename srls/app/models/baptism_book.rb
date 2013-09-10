class BaptismBook < ActiveRecord::Base
  belongs_to :user
  has_many :baptism_items
  attr_accessible :codigo, :numero, :paginas, :partidas_pagina, :validado
end
