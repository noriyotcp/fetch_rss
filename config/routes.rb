Rails.application.routes.draw do
  root :to => 'top#index'
  get '/fetch', to: 'posts#fetch'
  get 'hnrss/fetch', to: 'hnrss#fetch'
end
