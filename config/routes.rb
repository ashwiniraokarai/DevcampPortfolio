Rails.application.routes.draw do
  #Ash:standard resources were set up via rails g resource Portfolio title:string subtitle:string body:text image:text thumb_image:text
  #The exceptions were included by me singularize paths that look up single records but by default have plural such as portfolios/:id pointing to portfolios#show
  #The customization is just for practice. It is by no means a must.
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as:'portfolio_show'
  #now show route is singularized to portfolio/:id instead of the default portfolios/:id. It is also being given its own path helper portfolio_show. link_to show in index form needed to be updated accordingly.

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
