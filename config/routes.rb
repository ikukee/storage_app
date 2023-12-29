Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :directory_folder
  resources :item
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "main#login"
  get "/directory_folder", to: "main#index"
  get "/new", to: "directory_folder#new"
  get "/directory_folder/:id", to: "directory_folder#show"
  get "/directory_folder/:id/edit", to: "directory_folder#edit"
  get "/directory_folder/:id/upload", to: "item#upload"
  get "/directory_folder/:id/item/:item_id/edit", to: "item#edit"
  get "/logout", to: "main#logout"
  get '/a/reset_db', to: 'directory_folder#reset_database', via: :delete
  post "/login/proceed", to: "main#auth"
  post "/directory_folder/:id/item/:item_id/delete", to: "item#delete_item"
  post "/directory_folder/:id/edit/folder", to: "directory_folder#edit_folder"
  post "/directory_folder/:id/item/:item_id/edit_item", to: "item#edit_item"
  post "/directory_folder/:id/upload/item", to: "item#upload_item"
  post "/create/folder", to: "directory_folder#create"
  
end
