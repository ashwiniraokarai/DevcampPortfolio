Rails.application.routes.draw do
  #Ash:resources were set up via rails g resource Portfolio title:string subtitle:string body:text image:text thumb_image:text
  resources :portfolios

  #Ash:home about contact were set up as part of Pages controller (rails g controller Pages home about contact)
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  #Ash: resources encapsulates all the necessary RESTful routes for Blogs scaffold)
  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
