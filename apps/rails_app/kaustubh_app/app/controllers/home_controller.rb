class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @customers = ShopifyAPI::Customer.find(:all)
    
  end
  
  def getCustomerEmails
    @emails = []
  
    for a in @customers
      @emails << a.email
    end
    
  end
  
end
