class PagesController < ApplicationController
  def home
    @posts = Blog.includes(:topic) #Blog is the model that came generated via Blog scaffold
    @skills = Skill.all #Skill is the model that came generated via Skill model
  end

  def about
  end

  def contact
  end
end
