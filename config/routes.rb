Rails.application.routes.draw do
  get 'hatebu', to: 'hatebu#fetch'
  get 'hnrss', to: 'hnrss#fetch'
  root to: 'top#index'
end
