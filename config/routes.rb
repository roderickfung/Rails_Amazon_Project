Rails.application.routes.draw do
  root 'home#index'
  get '/about' => 'about#new'
  get '/contact' => 'contact#new'
  post '/contact' => 'contact#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
