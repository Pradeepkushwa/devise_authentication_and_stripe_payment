class Session < ApplicationRecord

	validates_presence_of :stripe_email, :stripe_token, :amount	,:description
end
