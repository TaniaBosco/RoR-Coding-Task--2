=begin
qlock/qburst/api/v1/sign_up for sign up operation
qlock/qburst/api/v1/sign_in for sign in operation
qlock/qburst/api/v1/sign_out for sign out operation
qlock/qburst/api/v1/get_places for getting places
=end
Demo::Application.routes.draw do
  devise_for :user1s,:controllers =>{:sessions => "sessions"},:controllers => {:registrations => "registrations"},:controllers => {:streets => "streets"}
  devise_scope :user1 do
       match "qlock/qburst/api/v1/sign_up",:to=> "Registrations#create", :via => [:get,:post]
       match "qlock/qburst/api/v1/sign_in",:to=> "sessions#create", :via => [:get,:post]
       match "qlock/qburst/api/v1/sign_out",:to=> "sessions#destroy", :via => [:get,:post] 
       match "qlock/qburst/api/v1/get_places",:to=> "streets#index", :via => [:get,:post]   
             end
 root :to=>"users#index"
resources :posts do
    member do
     end
      collection do
         get 'display'
         get 'signout_display'         
       end
   end
resources :streets do
    member do
     end
      collection do
         get 'index'
         post 'index'         
       end
   end

#devise_scope :user1 do
      #  post "sign_in" => "sessions#create"
      #  post "sign_up" => "registrations#create"
     #  end
    
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
