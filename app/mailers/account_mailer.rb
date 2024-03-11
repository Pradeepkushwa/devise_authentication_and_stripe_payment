class AccountMailer < ApplicationMailer



	def signup_email
		# debugger
         
         @account = params[:account]

         mail(to: @account.email, subject: "sign up successfully")
	end
end
