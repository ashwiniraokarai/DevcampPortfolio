module SetSource

  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  def set_source
    #Rails gives you access to the session hash. Both :source and :q are custom (developer defined), so you can all them anything you like.
    session[:source] = params[:q] if params[:q]
    #session[:source] is then leveraged in views/layouts/application.html.erb
  end

end
