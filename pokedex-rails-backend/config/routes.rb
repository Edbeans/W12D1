Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do 
    get '/pokemon/types', to: 'pokemon#types'
    resources :pokemon, only: [:index, :create, :show, :update] do 
      resources :items, only: [:index, :create]
    end 
    resources :item, only:[:update, :destroy]
  end
end
