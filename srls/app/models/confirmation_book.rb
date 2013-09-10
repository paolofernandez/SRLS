class ConfirmationBook < ActiveRecord::Base
  belongs_to :user
  has_many :confirmation_items, :dependent => :destroy
  attr_accessible :codigo, :numero, :paginas, :partidas_pagina, :validado
  validates :codigo, :uniqueness=>true
  validates :codigo, :numero, :presence=>true
end
