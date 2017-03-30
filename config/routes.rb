Emberyvr::Application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      jsonapi_resources :companies
    end
  end
end
