class HomeController < ApplicationController
  def index
    @quotes = current_user.quotes.order('id DESC')
    @tags = @quotes.map {|q| q.tag_list}.flatten.uniq
  end

  def tag
    return redirect_to root_path if params[:tag].blank?

    params[:tag] = params[:tag].strip
    @quotes = current_user.quotes.tagged_with(params[:tag]).order('id DESC')
    @tags = @quotes.map {|q| q.tag_list}.flatten.uniq
    render :index
  end
end
