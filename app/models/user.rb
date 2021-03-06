class User < ActiveRecord::Base

  attr_accessible  :active, :administrator, :dispensing_optician, :email, :first_name, :last_name, :password, :password_confirmation, :personal_title_id, :remember_me, :account_id

  belongs_to :account
  belongs_to :personal_title

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :registerable,
  # and :omniauthable
  devise :database_authenticatable, :timeoutable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  #validates :account_id, :presence => true
  validates :email, :presence => true, :length => { :maximum => 40 }
  validates :first_name, :length => { :maximum => 40 }
  validates :last_name, :presence => true, :length => { :maximum => 40 }
  validates :password, :confirmation => true, :length => { :minimum => 6 }, :presence => true, :on => :create

  default_scope { where("active = TRUE").order("last_name ASC, first_name ASC") }
  scope :active, where("active = TRUE").order("last_name ASC, first_name ASC")
  scope :readable_by, lambda { |account, user|
    where('account_id = ? AND id = ?', account.id, user.id).order("last_name ASC, first_name ASC")
  }

  def for(account, user)
    user.admin? ? User : User.readable_by(account, user)
  end

  def to_s
	    if first_name == nil or first_name.empty? then
	        if last_name == nil or last_name.empty? then
		        ""
		    else
		        last_name
		  end
	    else
		    if last_name == nil or last_name.empty? then
			    first_name
			else
			    "#{first_name} #{last_name}"
			end
		end
	end
end
