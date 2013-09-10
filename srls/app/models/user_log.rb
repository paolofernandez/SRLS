class UserLog < ActiveRecord::Base
  belongs_to :user
  attr_accessible :entrada, :salida
end
