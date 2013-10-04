class UpdatedDataTable < ActiveRecord::Base
  belongs_to :user
  has_many :updated_data_table_items
  attr_accessible :id_datum, :source_table
end
