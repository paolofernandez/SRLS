class ConfirmationItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :confirmation_book
  attr_accessible :celebrante, :edad, :fecha_bautizo, :fecha_confirmacion, :madre, :madrina, :nombre, :numero, :pagina,
      :padre, :padrino, :parroquia_bautizo, :parroquia_confirmacion, :tomo_libro, :validado
  validates :celebrante, :fecha_bautizo, :fecha_confirmacion, :nombre, :numero, :parroquia_bautizo, :pagina,
      :parroquia_confirmacion, :tomo_libro, :presence=>true
  validates :numero, :uniqueness => { :scope => :confirmation_book_id }
  validates :fecha_confirmacion, :uniqueness => { :scope => :nombre }
  
  before_save do
    if self.id != nil && self.id != 0
      old = ConfirmationItem.find(self.id)
      ind = 0
      object = UpdatedDataTable.new
      object.source_table = "Partida de Confirmacion"
      object.id_datum = self.id
      object.user = current_user
      object.save
      object.attributes.each do |datum|
        if datum.class.to_s != "Array"
          if datum != old.attributes[ind]
            data = UpdatedDataTableItem.new
            data.item = ind.to_s
            data.old_data = old.attributes[ind].to_s
            data.new_data = datum.to_s
          end
        end
        ind++
      end
    end
  end
end