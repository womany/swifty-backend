class SearchesController < ApplicationController
  before_action :authenticate_user!, :strip_params

  def show
    if params[:q].present?
      @quotes = current_user.quotes.search(:title_or_content_or_annotation_cont => params[:q]).result.paginate(:page => params[:page], :per_page => 20)
    else
      @quotes = []
    end
  end

  def strip_params
    return redirect_to root_path if params[:q].blank?
    params[:q] = params[:q].strip
  end
end
