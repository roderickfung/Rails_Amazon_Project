Rails.application.routes.draw do
  root 'home#index'
  get '/about' => 'about#new'
  get '/contact' => 'contact#new'
  post '/contact' => 'contact#new'

  # resources :categories, only: [:index] do
  #   get '/products/pages/:page' => 'products#index', as: :products_page
  #   resources :products, except:[:index] do
  #     resources :reviews, only: [:create, :destroy, :index]
  #   end
  # end

  resources :categories, only: [:index]
  resources :products do
    resources :reviews, only: [:create, :destroy, :index]
  end
end
