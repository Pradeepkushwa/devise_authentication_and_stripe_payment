class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
    def checkout
    byebug
    # product_details = retrieve_product_details(params[:product_id])
    se = Stripe::Checkout::Session.create({
      line_items: [
        {
          price_data: {
            currency: 'usd',
            product_data: {name: "T-shirt"},
            unit_amount: 2000
            # product_data: {name: params[:product_title]},
            # unit_amount: params[:total_price]
          },
          quantity: 1,
        }
      ],
      # customer: @current_user.stripe_id,
      # customer_email: @current_user.email,  # Include customer email
      billing_address_collection: 'required',  # Collect billing address
      shipping_address_collection: {
      allowed_countries: ['US'],  # Specify allowed shipping countries
      },
      mode: 'payment',
      success_url: 'http://localhost:4242/success.html',
      cancel_url: 'http://localhost:4242/cancel.html',
    })
    render json: se
  end

  # def retrive_checkout

  #   checkout_session = Stripe::Checkout::Session.retrieve(params[:checkout_session_id])
  #   @user.sessions.last.update(
  #         session_status: checkout_session.session_status,
  #         session_intent_id: checkout_session.session_intent)

  #   render json: {
  #         session_status: checkout_session.session_status,
  #         session_intent_id: checkout_session.session_intent
  #       }
  # end
end