class PagesController < ApplicationController
  def home
    @posts = Blog.all #Blog is the model that came generated with Blog Scaffold
  end

  def about
  end

  def contact
  end
end
