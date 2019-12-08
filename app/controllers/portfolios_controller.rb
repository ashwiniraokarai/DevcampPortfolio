class PortfoliosController < ApplicationController

  def index
    @portfolios = Portfolio.all #returns a collection
  end

end
