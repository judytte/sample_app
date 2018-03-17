Rails.application.routes.draw do

  resources :users

  #match '/Path' => 'Controller#Path', :via => [:get], :as => 'Helper _pat
  #match '/test1(.:format)' => 'test2#test1', :via => [:get], :as => 'test3_path'
 	match 'home' => 'static_pages', :via => [:get], :as => 'root'

 	#get 'Path/Helper', to: 'Controller#Path'
	get  '/help',    	to: 'static_pages#help'
	get  '/about',   	to: 'static_pages#about'
	get  '/contact',	to: 'static_pages#contact'
	get  '/signup',  	to: 'users#new'
end