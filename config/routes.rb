Rails.application.routes.draw do
  get '/fetch', to: 'posts#fetch'
  get '/recent', to: 'posts#fetch_by_recent'
  get '/popular', to: 'posts#fetch_by_popular'

  get 'hnrss/fetch', to: 'hnrss#fetch'
  get 'hnrss/recent', to: 'hnrss#fetch_by_recent'
  get 'hnrss/popular', to: 'hnrss#fetch_by_popular'
end
