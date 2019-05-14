Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api, format: 'json' do
    get 'connpass/event', only: [:event]
  end
  # namespace :api, format: 'json' do
  #   resources :tasks, only: [:index, :create, :update]
  # end
end
