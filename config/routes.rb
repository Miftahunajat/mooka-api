Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :jenis_umkms
      resources :umkms
      resources :communities
      resources :notifications
      resources :orders
      resources :pengirimen
      resources :products
      resources :ulasans
      resources :user_types
      resources :users_favorites
      resources :carts
      resources :community_umkms



      root to: "carts#index"
    end
  resources :pengirimen
  resources :_community_poins

  resources :ulasans
  resources :users_favorites
  resources :orders
  resources :products
  resources :umkms do
    resources :community_umkms
    post 'community_umkms/add_point', to: 'community_umkms#add_point'
  end
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
