class UpdatedDataTableItem < ActiveRecord::Base
  belongs_to :updated_data_table
  attr_accessible :item, :new_data, :old_data
end
