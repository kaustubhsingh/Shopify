class UserMailer < ApplicationMailer

  default from: 'ksingh@nomail.com'
 
  def welcome_email
    @customer_email = params[:user]
    @url  = 'http://example.com/login'
    attachments.inline['banner.jpeg'] = File.read("#{Rails.root}/app/assets/images/banner.jpeg")
    mail(to: @customer_email, subject: 'Thanks for your purchase!')
  end
  
end
