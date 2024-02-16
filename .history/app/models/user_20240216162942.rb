class User < ActiveRecord::Base
 
      
        devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
        after_create :create_user_cart
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

    def create_user_cart
  Cart.create(user: self)
    end
    def self.ransackable_attributes(auth_object = nil)
      ["allow_password_change", "confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "email", "encrypted_password", "id", "image", "name", "nickname", "provider", "remember_created_at", "reset_password_sent_at", "reset_password_token", "tokens", "uid", "unconfirmed_email", "updated_at"]
    end
  

  end