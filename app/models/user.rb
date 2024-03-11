class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :create_stripe_account
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "password_digest", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end    

  def create_stripe_account
    # Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    customer = Stripe::Customer.create(
    email: self.email,
    )

    self.update(stripe_id: customer.id)
  end 
end
