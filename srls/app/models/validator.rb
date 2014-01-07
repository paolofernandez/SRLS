class Validator < ActiveRecord::Base
  belongs_to :user
  attr_accessible :comentario, :id_dato, :tabla, :valido
  validates :comentario, :uniqueness=>true, :presence=>true

  def dato
  	case self.tabla
	  when "Libro de Bautizo"
		BatismBook.find(self.id_dato)
	  when "Partida de Bautizo"
		BatismItem.find(self.id_dato)
	  when "Libro de Confirmacion"
		ConfirmationBook.find(self.id_dato)
	  when "Partida de Confirmacion"
		ConfirmationItem.find(self.id_dato)
	  when "Libro de Defuncion"
		DeathRecordBook.find(self.id_dato)
	  when "Partida de Defuncion"
		DeathRecordItem.find(self.id_dato)
	  when "Libro de Matrimonio"
		MarriegeBook.find(self.id_dato)
	  when "Partida de Matrimonio"
		MarriegeItem.find(self.id_dato)
	  else
		nil
	end
  end
end