module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_title
  end

  def set_title
    @page_title = "Devcamp Portfolio | My Portfolio Website"
    #ASH: @page_title is referenced in (utilized by) application.html.erb.
    #NOTE: @page_title is also set to different values across individual controllers
    #this way the corresponding views display their page title based on the titles set in their controller
    #this is easier and efficient than going to individual view files and changing the title there?

    @seo_keywords = "Rails Portfolio App"
  end
end
 
