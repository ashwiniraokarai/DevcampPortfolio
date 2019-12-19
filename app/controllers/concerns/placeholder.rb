module Placeholder #use module instead of class so that the function can be shared across the app
  extend ActiveSupport::Concern #will load helper methods

  #this custom method will serve as a helper method for image generation
  #for example, in skill.rb file and portfolio.rb file def set_defaults
  def self.image_generator(height:, width:)
    "https://place-hold.it/#{height}*#{width}"
  end
end
