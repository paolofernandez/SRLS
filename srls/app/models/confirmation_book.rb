class ConfirmationBook < ActiveRecord::Base
  belongs_to :user
  has_many :confirmation_items
  attr_accessible :codigo, :numero, :paginas, :partidas_pagina, :validado
end
