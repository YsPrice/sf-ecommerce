class User < ActiveRecord::Base
        extend Devise::Models
        before_validation :set_uid, on: :create

  

            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :trackable, :validatable,
                    :confirmable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
   
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
    has_many :orders
    has_many :cart_items
    has_one :cart

    private
    def set_uid
        if self.uid.blank?
        self.uid = self.email 
      end
end
   

  end