Rails.application.routes.draw do
  namespace :api do
    resources :short_links, only: [:create, :show], path: '/short-links'
  end

  get '/r/:short_url_code', to: 'redirects#show', as: :redirects
end
