Rails.application.routes.draw do
  get 'hatebu/fetch', to: 'hatebu#fetch'

  root :to => 'top#index'
  get '/fetch', to: 'posts#fetch'
  get 'hnrss/fetch', to: 'hnrss#fetch'
end
