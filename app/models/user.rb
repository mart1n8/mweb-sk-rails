class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :editor], multiple: true)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable

  validates :username, presence: { message: "^Používateľské meno nemôže byť prázdne." }
  validates :username, uniqueness: { message: "^Používateľské meno sa už databáze nachádza." }


  validates :email, presence: { message: "^Emailová adresa nemôže byť prázdna." }
  validates :email, uniqueness: { message: "^Emailová adresa sa už v databáze nachádza." }
  
  validates :password, length: { in: 6..20, message: "^Heslo musí byť dlhé 6 až 20 zanakov." }
  validates :password, confirmation: { message: "^Heslo a potvrdenie hesla sa musia zhodovať." }



  def available_roles_hash
    available_roles_hash  = Hash.new
        self.available_roles.collect do |role|
          available_roles_hash[role] = role
        end
        return available_roles_hash
  end


end
