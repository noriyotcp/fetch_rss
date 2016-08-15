Rails.application.routes.draw do
  get '/fetch', to: 'posts#fetch'
  get 'hnrss/fetch', to: 'hnrss#fetch'
end
