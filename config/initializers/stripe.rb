# config/initializers/stripe.rb
Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY']

 }

Stripe.api_key = Rails.configuration.stripe[:secret_key]
# config/initializers/stripe.rb
Stripe.api_version = 'latest'
