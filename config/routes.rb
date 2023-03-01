Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/products" => "products#index"
  post "/products" => "products#create"
  get "/products/:id" => "products#show"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destory"

  post "/users" => "users#create"

  post "sessions" => "sessions#create"

  post "carted_products" => "carted_products#create"
  get "carted_products/:id" => "carted_products#show"
  get "carted_products" => "carted_products#index"

  get "orders" => "orders#index"
  get "orders/:id" => "orders#show"
  post "orders" => "orders#create"
end
