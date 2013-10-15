class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :rol, :status
  # attr_accessible :title, :body
  
  validates :email, :presence=>true, :uniqueness=>true
  validates :password, :presence=>true
  
  has_many :baptism_books
  has_many :baptism_items
  has_many :confirmation_books
  has_many :confirmation_items
  has_many :death_record_books
  has_many :death_record_items
  has_many :marriege_books
  has_many :marriege_items
  has_many :user_logs
  has_many :updated_data_tables
  has_many :validators
  
  after_save do
    if self.current_sign_in_at != nil
      mis_logs = UserLog.where(:user_id => self.id, :entrada => self.current_sign_in_at)
      if mis_logs == nil || mis_logs == []
        log = UserLog.create(:entrada => current_sign_in_at)
        log.user = self
        log.save
      end
    else
      mis_logs = UserLog.where(:user_id => self.id, :entrada => self.last_sign_in_at)
      if mis_logs != nil && mis_logs != []
        if mis_logs[0].salida == nil
          mis_logs[0].salida = DateTime.now
          mis_logs[0].save
        end
      end
    end
  end
end
