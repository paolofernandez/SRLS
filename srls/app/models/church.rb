class Church < ActiveRecord::Base
  attr_accessible :codigo, :nombre, :vicaria, :zona
  validates :codigo, :uniqueness=>true
end
