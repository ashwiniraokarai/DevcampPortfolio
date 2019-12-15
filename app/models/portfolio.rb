class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body

  #this is a custom scope (custom query) method created here for ease and is actually utilized in the controller
  #this is considered a better practice than having the queries written on the controller
  def self.ruby_on_rails
    where(subtitle: 'Ruby on Rails')
  end

  #this is another way of writing a scope
  scope :angular, -> { where(subtitle: 'Angular') }
end
