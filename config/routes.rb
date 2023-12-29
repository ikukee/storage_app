Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :directory_folder
  resources :item
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "main#index"
  get "/new", to: "directory_folder#new"
  get ":id", to: "directory_folder#show", as: @directory_folder
  get ":id/edit", to: "directory_folder#edit"
  get ":id/upload", to: "item#upload"
  get ":id/item/:item_id/edit", to: "item#edit"
  get 'a/reset_db', to: 'main#reset_database', via: :delete
  post ":id/item/:item_id/delete", to: "item#delete_item"
  post ":id/edit/folder", to: "directory_folder#edit_folder"
  post ":id/item/:item_id/edit_item", to: "item#edit_item"
  post ":id/upload/item", to: "item#upload_item"
  post "/create/folder", to: "directory_folder#create"
  
end
