class BaptismBook < ActiveRecord::Base
  belongs_to :user
  has_many :baptism_items, :dependent => :destroy
  attr_accessible :codigo, :parroquia, :numero, :paginas, :partidas_pagina, :validado
  validates :codigo, :uniqueness=>true
  validates :codigo, :numero, :parroquia, :presence=>true
end
