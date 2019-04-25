Rails.application.routes.draw do
  root to: 'short_links#new'

  namespace :api do
    resources :short_links, only: [:create, :show], path: '/short-links'
  end

  resources :short_links, only: :new, path: '/short-links'

  get '/r/:short_url_code', to: 'redirect#show', as: :redirects
end
