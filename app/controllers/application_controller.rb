class ApplicationController < ActionController::Base
  #ASH: Enforce things that need to run before ALL of the other controllers
  #I need to permit the :name field I introduced into the /register and /edit forms
  #Placing code here because I can't access the pertinent controller Devise::RegistrationsController#create (file not available to me)
  #This isn't the place to put in controller code but doing it here until I can refactor
  #Typically you would write your own controller that inherits from E.g.: class RegistrationsController < Devise::RegistrationsController

  before_action :add_permitted_parameters_for_devise, if: :devise_controller?

  #You're saying run your method before all controllers/methods ONLY IF you receive any devise controller communication
  #devise_controller? is a special method defined under Module Devise::Controllers::Helpers

  def add_permitted_parameters_for_devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #sign_up is short for Devise::RegistrationsController#create
    devise_parameter_sanitizer.permit(:account_update, keys: [:name]) #account_update is short for Devise::RegistrationsController#update
  end

end
