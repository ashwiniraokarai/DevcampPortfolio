class Topic < ApplicationRecord
  #validations
  validates_presence_of :title

  #associations
  has_many :blogs
end
