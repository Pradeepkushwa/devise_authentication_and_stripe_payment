class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
    def checkout
    se = Stripe::Checkout::Session.create({
      line_items: [
        {
          price_data: {
            currency: 'usd',
            product_data: {name: "T-shirt"},
            unit_amount: 2000
          },
          quantity: 1,
        }
      ],
      billing_address_collection: 'required',
      shipping_address_collection: {
      allowed_countries: ['US'], 
      mode: 'payment',
      success_url: 'http://localhost:4242/success.html',
      cancel_url: 'http://localhost:4242/cancel.html',
    })
    render json: se
  end
end