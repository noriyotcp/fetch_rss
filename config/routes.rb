Rails.application.routes.draw do
  get '/fetch', to: 'posts#fetch'
end
