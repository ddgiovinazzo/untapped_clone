Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:index, :create, :show]
    resources :beers, only: [:index, :create, :show]
    post "beers/brewery", to: "beers#brewery"
    resources :breweries, only: [:index, :create, :show]
    resources :check_ins, only: [:create, :show]
    get "check_ins/search/:beer_id", to: "check_ins#search"
    resource :session, only: [:create, :destroy, :show]

  end
  root "static_pages#root"
end
