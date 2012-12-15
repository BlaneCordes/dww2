Dww2::Application.routes.draw do


  root :to => redirect("/users/sign_in")
  devise_for :users
  resources :users
  resources :free_agents
  resources :players
  resources :teams
  resources :emails
  resources :pages
  resources :authentications

  match "/auth/:provider/callback" => "authentications#create"
  match "/signout" => "authentications#destroy", :as => :signout
  match "/teams" => "teams#get_teams"



  match "/nfl_teams" => "authentications#get_nfl_teams"
  match "/nfl_league_transactions" => "authentications#get_nfl_league_transactions"
  match "/mlb_leagues" => "authentications#get_mlb_leagues"
  match "/nfl_players" => "authentications#get_nfl_players"  
  match "/my_mlb_players" => "authentications#get_my_mlb_players"    
  match "/mlb_player" => "players#get_mlb_player" 
  match "/nfl_player" => "players#get_nfl_player"
  match "/team_key" => "teams#get_team_key"              
  match "/leagues" => "users#leagues"   
  match "/current_user_info" => "authentications#current_user_info"    
  
            


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
