
#Note: Skill is just a model. It does not have its own controller. It is however instantiated and leveraged in Pages controller and Pages views
class Skill < ApplicationRecord
  include Placeholder #module in which image_generator method lives
  validates_presence_of :title, :percent_utilized

  #set default value for the newly added badge attribute/ add_column
  after_initialize :set_defaults

  def set_defaults
    #if self.badge == nil self.badge = "https://place-hold.it/250*250"
    self.badge ||= Placeholder.image_generator(height: 250, width: 250)
    #see concerns > placeholder.rb where custom helper method image_generator lives
    #image_generator simply takes the dimensions and calls https://place-hold.it/ with those dimensions
  end

  #create a concern that'll generate the url so you don't have to type in the url

end
