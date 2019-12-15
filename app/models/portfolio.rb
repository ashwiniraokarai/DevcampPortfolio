class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body
end
