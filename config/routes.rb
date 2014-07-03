Rails.application.routes.draw do

  resources :events do
    resources :invitations
    resources :statistics
    resources :costs
  end
  
  root 'events#index'

end
