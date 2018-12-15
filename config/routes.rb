Rails.application.routes.draw do

  get 'cart/cart'
  get 'cart/order'

  resources :postings do
    collection do
      get :add_to_cart
    end
  end
  devise_for :users
  resources :meteorites

  get 'home/refreshHomeData'
  get 'home/about'
  get '/about', to: redirect('/home/about')
  get 'home/home'
  root 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
