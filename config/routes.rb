SwiftyBackend::Application.routes.draw do
  get "home/index"
  devise_for :users,
             :controllers => {:sessions => "sessions",
                              :omniauth_callbacks => "users/omniauth_callbacks"},
             :path_names  => {:sign_in => "login",
                              :sign_out => "logout"}

  resource :search, :only => [:show]
  get '/tag' => 'home#tag', :as => :tag

  mount GrapeSwaggerRails::Engine => '/api/swagger'
  mount API => '/api'
  mount SwaggerRoot => '/'

  authenticated :user do
    root 'home#index', :as => :authenticated_root
  end
  root 'welcome#index'
end
