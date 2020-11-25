class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable

  validates :username, presence: { message: "^Používateľské meno nemôže byť prázdne." }
  validates :username, uniqueness: { message: "^Používateľské meno sa už databáze nachádza." }


  validates :email, presence: { message: "^Emailová adresa nemôže byť prázdna." }
  validates :email, uniqueness: { message: "^Emailová adresa sa už v databáze nachádza." }
  
  validates :password, length: { in: 6..20, message: "^Heslo musí byť dlhé 6 až 20 zanakov." }
  validates :password, confirmation: { message: "^Heslo a potvrdenie hesla sa musia zhodovať." }

end
