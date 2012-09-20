TuDew::Application.routes.draw do
  
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
	devise_for :users
  root :to => "home#index"


  resources :to_dos, :except => :index	
#  match '/to_dos/new' => 'to_dos#new', :via => ['get']
#  match '/to_dos' => 'to_dos#create', :via => ['post']
#  match '/to_dos/edit/:id' => 'to_dos#edit', :via => ['post']
#  match '/to_dos/:id' => 'to_dos#update', :via => ['put'], :as => :update_to_dos
#  match '/to_dos/:id' => 'to_dos#destroy', :via => ['delete']

  match '/categories/new' => 'categories#new', :via => ['post', 'get']
  match '/categories' => 'categories#create', :via => ['post']
  match '/categories/list/:id' => 'categories#list', :via => ['get']
  match '/categories/list/' => 'categories#list', :via => ['get']


end
