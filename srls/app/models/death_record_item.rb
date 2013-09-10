class DeathRecordItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :death_record_book
  attr_accessible :celebrante, :edad, :fecha, :lugar_sepultura, :madre, :motivo_muerte, :nombre, :numero, :padre, :tipo_hijo, :tomo_libro, :validado
end
