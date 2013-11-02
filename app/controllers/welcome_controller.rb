class WelcomeController < ApplicationController
  def index
    @quotes = Quote.includes(:user).all
  end
end
