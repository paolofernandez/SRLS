class DeathRecordBook < ActiveRecord::Base
  belongs_to :user
  has_many :death_record_items
  attr_accessible :codigo, :numero, :paginas, :parroquia, :partidas_pagina, :validado
end
