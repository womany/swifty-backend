class WelcomeController < ApplicationController
  def index
    @quotes = Quote.includes(:user).order('id DESC')
  end
end
