Photo::Application.routes.draw do
  get "home/index"

  resources :user_sessions, :only => [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :admin, :only => [:index]
  resources :albums
  resources :gallery, :only => [:index]
  match "/gallery_reset" => "gallery#reset"
  resources :pictures, :except => [:index]
  resources :posts, :only => [:new, :create, :index, :destroy]
  resources :volumes, :only => [:new, :create, :index, :destroy] # is this needed?

  #match "/contact" => "home#contact"
  match "/about" => "home#about"
  match "/blog" => "home#blog"
  match "/framing" => "home#framing"
  match "/pricing" => "home#pricing"

  match "/set_gallery_session" => "application#set_gallery_session", via: :post
  match "/get_gallery_session" => "application#get_gallery_session", via: :get

 #match "/admin/upload" => "admin#upload"
 #match "/admin/order" => "admin#order"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
