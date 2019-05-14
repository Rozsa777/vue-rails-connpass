Rails.application.routes.draw do
  get 'connpass#index'
  root to: 'home#index'
end
