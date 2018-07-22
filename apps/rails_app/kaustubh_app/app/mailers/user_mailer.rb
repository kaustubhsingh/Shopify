class UserMailer < ApplicationMailer

  default from: 'shopifyksingh@gmail.com'
 
  def welcome_email
    @customer_email = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @customer_email, subject: 'Welcome to My Awesome Site')
  end
  
end
