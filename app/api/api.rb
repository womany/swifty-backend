require 'rack/cors'

class API < Grape::API
  use Rack::Cors do
    allow do
      origins '*'
      resource '*', :headers => :any, :methods => :get
    end
  end

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