Rails.application.routes.draw do
  namespace :api do
    resources :short_links, only: :create, path: '/short-links'
  end
end
