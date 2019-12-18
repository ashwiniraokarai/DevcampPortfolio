class PortfoliosController < ApplicationController

  def index
    @portfolios = Portfolio.all        #returns a collection of all portfolios
  end

  def ruby_on_rails
    #@portfolios = Portfolio.where(subtitle: "Ruby on Rails") #returns a filetered collection of portfolios with a specific subtitle

    #The custom query above was moved to the Model as a custom scope named rails and is being called here
    #Controller should only be responsible for data flow just like a traffic controller and not worry about logic
    @rails_portfolios = Portfolio.ruby_on_rails
  end

  def angular
    @angular_portfolios = Portfolio.angular
  end

  def new
    #The corresponding view typically has the form a user submits to create a portfolio
    @portfolio = Portfolio.new
    #Ash: new simply instantiates a new Portfolio Model object and..
    #gives the ability to have the form to create a new Portfolio
    #new needs to connect the form (via submit) to create action
    #NOTE: this DOES NOT have the ability to grab any form information
  end

  def create
    #Grab form data submitted by user and save to database
    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    if @portfolio.save
      redirect_to(portfolios_path, notice: "Your portfolio has been added!")  #index
      #if you wanted to redirect to the custom routed show page instead, you'd do: portfolio_show_path(@portfolio)
    else
      render new
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(params.require(:portfolio).permit(:title, :subtitle, :body))
      redirect_to(portfolio_show_path, notice: "Your portfolio has been updated") #index
    else
      render edit
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to(portfolios_path, notice: "Your portfolio has been removed")
  end

end
