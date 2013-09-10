class BaptismBook < ActiveRecord::Base
  belongs_to :user
  has_many :baptism_items, :dependent => :destroy
  attr_accessible :codigo, :numero, :paginas, :partidas_pagina, :validado
  validates :codigo, :uniqueness=>true
end
