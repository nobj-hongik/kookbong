Rails.application.routes.draw do
  get 'eposts/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" , :registrations=>'registrations'  }
  root 'posts#index'
  resources :posts, except: [:show, :create, :destroy] 
  resources :uposts do
     resources :ucomments, only: [:create, :destroy] 
  end
  resources :tposts , except: [:show] do
    resources :tcomments, only: [:create, :destroy] 
  end 
  
  resources :eposts do
     resources :ecomments, only: [:create, :destroy] 
  end
  resources :supports do
     resources :scomments, only: [:create, :destroy] 
  end 
  resources :bars do
     collection do
      get 'search'
     end
     resources :bcomments, only: [:create, :destroy] 
  end   
  resources :intros, only: [:index]
  get 'tposts/index/:user_id' => "tposts#index"   
  get 'posts/kbeditor' => "posts#kbeditor"     
  get 'supports/admin/masterindex' => "supports#masterindex"     
  post '/tinymce_assets' => 'tinymce_assets#create'
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
