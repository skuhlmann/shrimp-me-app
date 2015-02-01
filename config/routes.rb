Rails.application.routes.draw do

  root to: "urls#index"

  resources :urls, only: [:create]

  resources :urls, path: "",  param: :slug, only: [:show]
  # resources :urls, path: "r",  param: :slug, only: [:show]

end
