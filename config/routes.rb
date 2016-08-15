Rails.application.routes.draw do
  get '/fetch', to: 'posts#fetch'
  get '/recent', to: 'posts#fetch_by_recent'
  get '/popular', to: 'posts#fetch_by_popular'
end
