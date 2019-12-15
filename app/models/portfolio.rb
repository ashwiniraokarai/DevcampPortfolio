class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body

  #this is a scope (custom query) method created here for ease and is actually utilized in the controller
  #this is considered a better practice than having the queries written on the controller
  def self.ruby_on_rails
    where(subtitle: 'Ruby on Rails')
  end

  #this is another way of writing a scope
  scope :angular, -> { where(subtitle: 'Angular') }

  #set default values for image field (if there is NO preexisting image ONLY) AFTER new (entering details into the form)
  #and BEFORE user CREATES (submits) the form. Do not overwrite
  after_initialize :set_defaults

  def set_defaults
    #if self.image == nil
      #self.image = "https://place-hold.it/600*400"
    #end

    #"||=" operator is the shortcut for "if"
      self.image ||= "https://place-hold.it/600*400"
  end
end
