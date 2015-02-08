Rails.application.routes.draw do

  root to: "urls#index"

  resources :urls, only: [:create]

  resources :urls, path: "",  param: :slug, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :urls, only: [:create]
    end
  end
end
