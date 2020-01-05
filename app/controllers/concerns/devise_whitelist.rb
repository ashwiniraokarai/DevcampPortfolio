#ASH: this module is accessed (called by) /controllers/application_controller.rb via the "include" keyword

module DeviseWhitelist
  #tells rails that we are creating a concern
  extend ActiveSupport::Concern  #Gives the ability to access methods of ActiveSupport::Concern module

  #ASH: "included" is a callback. Code within the included block is invoked WHEREVER this receiver module (DeviseWhitelist) is included in another module or class.
  #In our case, DeviseWhitelist is included in /controllers/application_controller.rb class
  included do
    before_action :add_permitted_parameters_for_devise, if: :devise_controller?
  end

  def add_permitted_parameters_for_devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #sign_up is short for Devise::RegistrationsController#create
    devise_parameter_sanitizer.permit(:account_update, keys: [:name]) #account_update is short for Devise::RegistrationsController#update
  end

end
