Rails.application.routes.draw do
  get 'search/index'
  post 'search/index', to: 'search#index'
  get 'navs/faq'
  get 'navs/news'
  get 'navs/contact'
  get 'navsfaq/news'
  get 'navsfaq/contact'
  get 'access/new'
  post 'access/new', to: 'access#create'
  get 'access/create'
  get 'access/destroy'
  get 'admin/index'
  resources :users
  resources :orders
  resources :lineitems 
  resources :carts
  get 'shopper/index' #goes to shopper#index action
  # get '/', to: "shopper#index"
  root "shopper#index", as: 'shopper' #shopper_url, showpper_path
  resources :products #new_product_path, new_product_url
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/shopper', to: 'shopper#index'
  get '/admin', to: 'admin#index'
  get '/login', to: 'access#new'
  post '/login', to: 'access#create'
  get '/logout', to: 'access#destroy'
  post '/logout', to: 'access#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
end
