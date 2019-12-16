#result of rails g model Technology name:string portfolio:references
class Technology < ApplicationRecord
  belongs_to :portfolio
end
