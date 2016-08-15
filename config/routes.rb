Rails.application.routes.draw do
  get 'hatebu/fetch', to: 'hatebu#fetch'
  get 'hnrss/fetch', to: 'hnrss#fetch'
  root :to => 'top#index'
end
