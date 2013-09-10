class DeathRecordBook < ActiveRecord::Base
  belongs_to :user
  has_many :death_record_items, :dependent => :destroy
  attr_accessible :codigo, :numero, :paginas, :parroquia, :partidas_pagina, :validado
  validates :codigo, :uniqueness=>true
  validates :codigo, :numero, :parroquia, :presence=>true
end
