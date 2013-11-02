SwiftyBackend::Application.routes.draw do
  get "home/index"
  devise_for :users,
             :controllers => {:sessions => "sessions",
                              :omniauth_callbacks => "users/omniauth_callbacks"},
             :path_names  => {:sign_in => "login",
                              :sign_out => "logout"}


  mount GrapeSwaggerRails::Engine => '/api/swagger'
  mount API => '/api'
  mount SwaggerRoot => '/'

  root 'home#index', as: :authenticated_root
  root 'welcome#index'
end
