Rails.application.routes.draw do
 root "home#index"


  match ':controller(/:action(/:id))', :via => [:get, :post]
end
