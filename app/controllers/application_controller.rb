class ApplicationController < ActionController::Base
  #ASH: Enforce things that need to run before ALL of the other controllers
  #I need to permit the :name field I introduced into the /register and /edit forms of Devise
  #Placing code here because I can't access the pertinent controller Devise::RegistrationsController#create (file not available to me)
  #This isn't the place to put in controller code but the best place to test (least number of calls and file interdependencies). Doing it here until I can organize
  #Typically you would write your own controller that inherits from E.g.: class RegistrationsController < Devise::RegistrationsController...
  #OR move to a generic module inside /controllers/concerns/ that can be accessed across the project
  #The code was eventually moved to a module DeviseWhitelist inside /controllers/concerns/devise_whitelist.rb

  ##before_action :add_permitted_parameters_for_devise, if: :devise_controller?

  #You're saying run your method before all controllers/methods ONLY IF you receive any devise controller communication
  #devise_controller? is a special method defined under Module Devise::Controllers::Helpers

  ##def add_permitted_parameters_for_devise
    ##devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #sign_up is short for Devise::RegistrationsController#create
    ##devise_parameter_sanitizer.permit(:account_update, keys: [:name]) #account_update is short for Devise::RegistrationsController#update
  ##end

  include DeviseWhitelist

  #============================================
  #During refactor, code was moved to module SetSource inside /controllers/concerns/set_source.rb
  #track a query string parameter called "q" in a session so you can persist that specific data between requests (pages)
  #E.g.: http://localhost:3000/portfolio/4?q="twitter" followed by /blogs (no need for entering q again since session info is passed b/w pages)

  ##before_action :set_source

  ##def set_source
    #Rails gives you access to the session hash. Both :source and :q are custom (developer defined), so you can all them anything you like.
    ##session[:source] = params[:q] if params[:q]
    #session[:source] is then leveraged in views/layouts/application.html.erb
  ##end

  include SetSource

  #============================================
  #During refactor, code was moved to module CurrentUser inside /controllers/concerns/set_source.rb

  ##before_action :current_user

  #Override the current_user method of Devise
  ##def current_user
    #super simply calls the current_user method Devise (parent) which results in an instance of User model
    #call current_user of parent IF current_user of parent exists (if user logged in is true)
    #else mimic a user via OpenStruct as though they are coming from the database
    ##super || OpenStruct.new(name:"Guest User", first_name: "Guest", last_name: "User", email: "guest@example.com")
  ##end

  include CurrentUser

  #============================================

  #before_action :set_title

  #def set_title
    #@page_title = "Devcamp Portfolio | My Portfolio Website"
    ##ASH: @page_title is referenced in (utilized by) application.html.erb.
    ##NOTE: @page_title is also set to different values across individual controllers
    ##this way the corresponding views display their page title based on the titles set in their controller
    ##this is easier and efficient than going to individual view files and changing the title there?
  #end

  include DefaultPageContent
end
