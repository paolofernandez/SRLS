class DeathRecordItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :death_record_book
  attr_accessible :celebrante, :edad, :fecha, :lugar_sepultura, :madre, :motivo_muerte, :nombre, :numero, :padre,
       :tipo_hijo, :tomo_libro, :validado
  validates :celebrante, :edad, :fecha, :motivo_muerte, :nombre, :numero, :pagina, :tomo_libro, :presence=>true
  validates :numero, :uniqueness => { :scope => :death_record_book_id }
  validates :fecha, :uniqueness => { :scope => :nombre }
end