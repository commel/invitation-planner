Rails.application.routes.draw do
  
  resources :events do
    resources :invitations
  end
  
  root 'events#index'

end
