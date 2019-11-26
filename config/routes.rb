Rails.application.routes.draw do
  resources :pengirimen
  resources :_community_poins
  resources :community_umkms
  resources :ulasans
  resources :users_favorites
  resources :orders
  resources :products
  resources :umkms
  resources :communities
  resources :jenis_umkms
  resources :users do
    resources :notifications
    delete 'carts/clear', to: 'carts#remove_all'
    post 'carts/checkout', to: 'carts#checkout'
    resources :carts, except: [:destroy] do
      collection do
        delete :remove_all
      end
    end
  end
  resources :user_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
