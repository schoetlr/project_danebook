Rails.application.routes.draw do
  

  get 'newsfeed/newsfeed'

  get 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login

  resource :session

  resources :friendings, only: [:create, :destroy]
  
  resources :photos, only: [:destroy]

  resources :users, shallow: true do
    get 'friends'
    get 'newsfeed' => 'newsfeed#newsfeed'

    post 'set_profile_photo' => 'profiles#set_profile_photo'
    post 'set_cover_photo' => 'profiles#set_cover_photo'

    resources :photos do
      resources :likes,
                only: [:create, :destroy],
                default: { likeable: "Photo" } 
      resources :comments,
                only: [:create, :destroy], 
                default: { commentable: "Photo" } do 

        resources :likes, only: [:create, :destroy],
                          default: { likeable: "Comment" }
      end
    end

    resources :posts do 
      resources :likes,
                 only: [:create, :destroy],
                :defaults => { :likeable => "Post" }
      
      resources :comments, :default => { :commentable => "Post" } do 
        resources :likes, 
                  only: [:create, :destroy],
                  :default => { :likeable => "Comment" }
      
      end

    end
  end

  
  root 'static_pages#home'

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
end
