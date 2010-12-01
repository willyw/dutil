ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "daily_downloads", :action => "index" 
  
  map.resource :user_session
  map.login "/login", :controller => "user_sessions", :action => "new" 
  map.logout "/logout" , :controller  => "user_sessions", :action => "destroy" 
  
  map.resource :account, :controller => "users"
  map.resources :users
  
  map.resources :daily_downloads

    
    
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
