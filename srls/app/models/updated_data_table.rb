class UpdatedDataTable < ActiveRecord::Base
  belongs_to :user
  attr_accessible :id_datum, :source_table
end
