module CurrentUser
  extend ActiveSupport::Concern

  included do
    before_action :current_user
  end

  def current_user
    #super simply calls the current_user method Devise (parent) which results in an instance of User model
    #call current_user of parent IF current_user of parent exists (if user logged in is true)
    #else mimic a user via OpenStruct as though they are coming from the database
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name:"Guest User",
                  first_name: "Guest",
                  last_name: "User",
                  email: "guest@example.com")
  end

end
