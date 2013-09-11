class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :rol
  # attr_accessible :title, :body
  
  validates :email, :uniqueness=>true
  
  has_many :baptism_books
  has_many :baptism_items
  has_many :confirmation_books
  has_many :confirmation_items
  has_many :death_record_books
  has_many :death_record_items
  has_many :marriege_books
  has_many :marriege_items
end
