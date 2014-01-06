Reservasuta::Application.routes.draw do
  
  devise_for :users
  resources :reservations 

  resources :drivers
  
  resources :vehicles

  get '/androidreserva' , to: 'reservations#androidreserva'

  get '/androidvehiculo' , to: 'reservations#androidvehiculo'

  get '/androidchofer' , to: 'reservations#androidchofer'

  get '/ir' , to: 'reservations#ir' 

  get '/liberar/:id' , to: 'reservations#liberar'

  get '/horamas0' , to: 'reservations#horamas0'

  get '/horamas1' , to: 'reservations#horamas1'

  get '/horamas2' , to: 'reservations#horamas2'

  get '/horamas3' , to: 'reservations#horamas3'

  get '/horamas4' , to: 'reservations#horamas4'

  get '/horamas5' , to: 'reservations#horamas5'

  get '/semanamas' , to: 'reservations#semanamas'

  get '/semanamenos' , to: 'reservations#semanamenos'
  get '/search', to: 'reservations#search'

  get '/estadodia', to: 'reservations#estadodia'

  get '/choferes', to: 'drivers#index'

  get '/vehiculos', to: 'vehicles#index'

  #match ':controller(/:action(/:id))(.:format)'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'reservations#index'

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
