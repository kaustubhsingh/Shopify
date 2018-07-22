class HomeController < ShopifyApp::AuthenticatedController

  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)

  end
 
  def run(email_list)
    email_list.each do |user|
      UserMailer.with(user: user).welcome_email.deliver_now
    end
  end
  
  def getEmails

    @customers = ShopifyAPI::Customer.find(:all)
    
    @emails = []
  
    for a in @customers
    	if a.email.to_s.empty?
    	else
			@emails << a.email
		end
    end
    
    run(@emails) 
    
    render "test"
  
  end


end
