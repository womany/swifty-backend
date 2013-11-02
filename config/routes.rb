SwiftyBackend::Application.routes.draw do
  devise_for :users,
             :controllers => {:sessions => "sessions",
                              :omniauth_callbacks => "users/omniauth_callbacks"},
             :path_names  => {:sign_in => "login",
                              :sign_out => "logout"}

  root 'welcome#index'
end
