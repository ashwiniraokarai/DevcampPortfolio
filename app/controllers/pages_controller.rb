class PagesController < ApplicationController
  def home
    @posts = Blog.all #Blog is the model that came generated via Blog Scaffold
  end

  def about
  end

  def contact
  end
end
