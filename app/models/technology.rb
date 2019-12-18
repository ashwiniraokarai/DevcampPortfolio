#result of rails g model Technology name:string portfolio:references
#This model is leveraged on it's parent model portfolio.rb
class Technology < ApplicationRecord
  belongs_to :portfolio
end
