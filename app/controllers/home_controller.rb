class HomeController < ApplicationController
  def index
    @quotes = current_user.quotes.order('id DESC')
  end
end
