Rails.application.routes.draw do
  #Ash: resources encapsulates all the necessary RESTful routes
  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
