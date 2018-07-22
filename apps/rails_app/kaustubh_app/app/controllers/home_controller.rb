class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)

  end
 
  def run
    @emails.each do |user|
      UserMailer.with(user: user).welcome_email.deliver_now
    end
  end
  
  def getEmails

    @customers = ShopifyAPI::Customer.find(:all)
    
    @emails = []
  
    for a in @customers
      @emails << a.email
    end
    
    run 
    
    render "test"
  
  end


end
