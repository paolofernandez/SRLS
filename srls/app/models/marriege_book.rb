class MarriegeBook < ActiveRecord::Base
  belongs_to :user
  has_many :marriege_items, :dependent => :destroy
  attr_accessible :codigo, :numero, :paginas, :parroquia, :partidas_pagina, :validado
  validates :codigo, :uniqueness=>true
  validates :codigo, :numero, :parroquia, :presence=>true
end
