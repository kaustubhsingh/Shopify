class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)

  end
  
  def getEmails

    @customers = ShopifyAPI::Customer.find(:all)
    
    @emails = []
  
    for a in @customers
      @emails << a.email
    end
    
    render "test"
  
  end


end
