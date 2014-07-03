Rails.application.routes.draw do

  resources :events do
    resources :invitations
    resources :statistics
  end
  
  root 'events#index'

end
