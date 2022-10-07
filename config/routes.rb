Rails.application.routes.draw do

  #get 'comments/index'
  root "homes#index"
  devise_for :users
  #delete "/users/id/posts", to: "posts#destroy"
  resources :users do
    resources :posts do
     resources :likes 
      resources :comments 
     
    end
  end
  # devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  

  #  scope '(:locale)' do
  #   # We define here a route inside the locale thats just saves the current locale in the session
  #   get 'omniauth/:provider' => 'omniauth#localized', as: :localized_omniauth

  #   devise_for :users, skip: :omniauth_callbacks, controllers: { passwords: 'passwords', registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }
  # end
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 