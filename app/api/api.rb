require 'rack/contrib'

class API < Grape::API
  use Rack::JSONP
  format :json

  resources :quotes do
    post do
      user = User.find_by :email => params[:email]
      return result = {:msg => 'user not found!'} if user.nil?

      user.quotes.create(:url => params[:title],
                         :title => params[:title],
                         :comment => params[:comment],
                         :content => params[:content])
      result = {:msg => 'done!'}
    end
  end
end