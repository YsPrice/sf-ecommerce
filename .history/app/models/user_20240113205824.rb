class User < ActiveRecord::Base
        extend Devise::Models
        include DeviseTokenAuth::Concerns::User
            # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :trackable, :validatable,
                    :confirmable
                  
            # Include default devise modules.
         
  

    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
    has_many :orders
    has_many :cart_items
    has_one :cart

  

  end