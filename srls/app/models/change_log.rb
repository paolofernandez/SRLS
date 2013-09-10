class ChangeLog < ActiveRecord::Base
  belongs_to :user
  attr_accessible :hora, :id_objeto, :tabla
end
