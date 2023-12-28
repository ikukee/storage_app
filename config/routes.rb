Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #resources :directory_folder
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "main#index"
  get "/new", to: "directory_folder#new"
  get ":id", to: "directory_folder#show"
  get ":id/upload", to: "directory_folder#upload"
  post ":id/upload/item", to: "directory_folder#upload_item"
  post "/create/folder", to: "directory_folder#create"
end
