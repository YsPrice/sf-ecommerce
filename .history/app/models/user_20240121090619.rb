class User < ActiveRecord::Base

        before_validation :set_uid, on: :create

  
            # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :trackable, :validatable,
                    :confirmable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
                  
            # Include default devise modules.
         
  

    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
    has_many :orders
    has_many :cart_items
    has_one :cart

    private

    def set_uid
      self.uid = self.email if self.uid.blank?
    end

  end