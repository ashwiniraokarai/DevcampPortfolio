class Portfolio < ApplicationRecord
  has_many :technologies #manually added. rails added the other side of association (belongs_to) on the Technology model

  #nested attributes allow you to save attributes on associated records (i.e, technologies) through the parent (portfolio)
  #this allows you to create the portfolio and associated technologies records in one go
  #this helps wire up :technologies to html forms of portfolio
  #https://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |blockVariable| blockVariable['name'].blank? }
  #To test in the console: Portfolio.create(title: "Web app", subtitle: "sdfsgfdsgdfsg", body: "hjuyrtyrer", technologies_attributes: [{name:"Rails"}, {name:"Spring"}, {name:"Django"}, {name:"Angular"}]

  include Placeholder #module in which image_generator method lives

  validates_presence_of :title, :subtitle, :body

  #this is a scope (custom query) method created here for ease and is actually utilized in the controller
  #this is considered a better practice than having the queries written on the controller
  def self.ruby_on_rails
    where(subtitle: 'Ruby on Rails')
  end

  #this is another way of writing a scope using a lambda expression
  scope :angular, -> { where(subtitle: 'Angular') }

  #set default values for image field (if there is NO preexisting image ONLY) AFTER new (entering details into the form)
  #and BEFORE user CREATES (submits) the form. Do not overwrite
  after_initialize :set_defaults

  def set_defaults
    #if self.image == nil
      #self.image = "https://place-hold.it/600*400"
    #end

      #"||=" operator is the shortcut for "if"
      #self.image ||= "https://place-hold.it/600*400"
      self.image ||= Placeholder.image_generator(height: 600, width: 400)
      #see concerns > placeholder.rb where custom helper method image_generator lives
      #image_generator simply takes the dimensions and calls https://place-hold.it/ with those dimensions
  end
end
