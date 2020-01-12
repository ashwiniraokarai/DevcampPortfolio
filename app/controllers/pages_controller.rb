class PagesController < ApplicationController
  def home
    #Blog is the model that came generated via Blog scaffold
    #.includes(:topic) will filter only those Blogs that include (have) a topic they each belong to
    #note that this will fetch all Blogs as long they have associated topic_id column even if the value is nil
    #therefore filter further only for those Blogs that have a non-nil topic id
    @posts = Blog.includes(:topic).where.not(topic_id: nil)
              #@companies = Company.includes(:persons).where(:persons => { active: true } ).all
    @skills = Skill.all #Skill is the model that came generated via Skill model
  end

  def about
  end

  def contact
  end
end
