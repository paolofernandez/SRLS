class Church < ActiveRecord::Base
  attr_accessible :nombre, :vicaria
  
  before_save do
    if self.id != nil && self.id != 0
      old = Church.find(self.id)
      ind = 0
      object = UpdatedDataTable.new
      object.source_table = "Iglesia"
      object.id_datum = self.id
      object.user = self.user
      object.save
      object.attributes.each do |datum|
        if datum.class.to_s != "Array"
          if datum != old.attributes[ind]
            data = UpdatedDataTableItem.new
            data.item = ind.to_s
            data.old_data = old.attributes[ind].to_s
            data.new_data = datum.to_s
            data.save
          end
        end
        ind+=1
      end
    end
  end
end
