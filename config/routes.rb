Rails.application.routes.draw do
  get '/fetch', to: 'posts#fetch'

  get 'hnrss/fetch', to: 'hnrss#fetch'
  get 'hnrss/recent', to: 'hnrss#fetch_by_recent'
  get 'hnrss/popular', to: 'hnrss#fetch_by_popular'
end
