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
                         :annotation => params[:annotation],
                         :content => params[:content],
                         :access_token => params[:access_token])
      result = {:msg => 'done!'}
    end
  end

  resources :users do
    post do
      user = User.find_by :email => params[:email]
      if user.nil?
        User.create(:name => params[:name],
                    :uid => params[:uid],
                    :provider => 'facebook',
                    :email => params[:email],
                    :password => Devise.friendly_token[0,20]
                   )
      end
      result = {:msg => 'done!'}
    end
  end
end