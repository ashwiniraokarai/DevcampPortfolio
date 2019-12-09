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

  #Ash:Setting up the root (/) to hit pages/home page such that it overrides the default "yay, you're on rails" page
  root to: "pages#home"

  #Ash:Setting up /about and /contact to hit pages/about and pages/contact
  get "about", to: "pages#about"  #you can specify any string for the route that you want. Intead of "about", you can write anything "asdf"
  get "contact", to: "pages#contact"

end
