Rails.application.routes.draw do

  get 'users/new'

  #get 'users/new'

 	match 'static_pages/home' => 'home', :via => [:get], :as => 'root'
  	match 'static_pages/help' => 'help', :via => [:get], :as => 'help'
	match 'static_pages/about' => 'about', :via => [:get], :as => 'about'
	match 'static_pages/contact' => 'contact', :via => [:get], :as => 'contact'
	match 'users/new' => 'signup', :via => [:get], :as => 'signup'

end