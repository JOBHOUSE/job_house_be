Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users', to: 'users#show'
      resources :jobs, only: [:index]
    end
  end
end
