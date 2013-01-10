class Employee < User

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :registerable,
  # and :omniauthable
  devise :database_authenticatable, :timeoutable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

end
