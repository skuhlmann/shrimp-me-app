Rails.application.routes.draw do

  root to: "urls#index"

  resources :urls, only: [:create]

end
