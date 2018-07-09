Rails.application.routes.draw do
  root :to => 'home#index'
  
  get 'emails' => 'home#getEmails'
  
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
