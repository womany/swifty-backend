SwiftyBackend::Application.routes.draw do
  devise_for :users,
             :controllers => {:sessions => "sessions",
                              :omniauth_callbacks => "users/omniauth_callbacks"},
             :path_names  => {:sign_in => "login",
                              :sign_out => "logout"}


  mount GrapeSwaggerRails::Engine => '/api/swagger'
  mount API => '/api'
  mount SwaggerRoot => '/'

  root 'welcome#index'
end
