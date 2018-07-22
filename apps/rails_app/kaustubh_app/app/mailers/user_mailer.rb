class UserMailer < ApplicationMailer

  default from: 'ksingh@nomail.com'
 
  def welcome_email
    @customer_email = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @customer_email, subject: 'Welcome to My Awesome Site')
  end
  
end
