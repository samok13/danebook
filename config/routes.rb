Rails.application.routes.draw do

  root 'users#new'

  resource :profile, :only => [:edit, :update]

  resources :photos, :only => [:new, :create] do
    get "serve"   # photo_serve_path, e.g. /photos/1/serve
  end

  resources :users do 
    resource :profile, :only => [:show]
    resource :timeline, :only => [:show]
    resources :photos, :only => [:index, :show]
  end

  resources :posts, only: [:index, :create, :destroy] do
    resources :likes, only: [:create], defaults: {:likeable => 'Post'}
  end

  resources :comments, only: [:create, :destroy] do
    resources :likes, only: [:create], defaults: {:likeable => 'Comment'}
  end

  resources :likes, only: [:create, :destroy]

  resources :friendings, :only => [:create, :destroy]

  resource :session, :only => [:new, :create, :destroy]
  get "login" => "users#new"
  delete "logout" => "sessions#destroy"
end


  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

