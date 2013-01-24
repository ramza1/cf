Cf::Application.routes.draw do


  resources :newsletters do
    member do
      post :mail_subscribers
    end
  end


  get 'tags/:tag', to: "blogs#index", as: :tag
  mount Ckeditor::Engine => '/ckeditor'

  resources :tips

  match "/search" => "home#search", :as => :search
  resources :magazines

  resources :videos

  resources :slides

  resources :right_ads

  resources :top_ads

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout" }, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :look_books do
    resources :photos
  end


  resources :functional_fashion_designers

  namespace :fashion do
    resources :fashion_juries
    resources :trend_spottings do
      resources :photos
    end
    resources :men_fashions  do
      resources :photos
    end
  end

  resources :trend_spottings do
    resources :photos
  end

  match '/fashion' => "fashion#show", :as => :fashion


  resource :runway

  namespace :runway do
    resources :collections do
      resources :photos
    end
    resources :seasons
    resources :years
  end

  namespace :style do
    resources :functional_fashions
    resources :look_books
    resources :tips
  end

  resources :redcarpets do
    resources :photos
  end

  resources :functional_fashions
  resources :blogs

  resources :features

  resources :photos
  resources :men_fashions do
    resources :photos
  end

  resources :fashion_juries

  resources :subscriptions



  match '/style' => "style#show", :as => :styles
  root :to => "home#index"

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
