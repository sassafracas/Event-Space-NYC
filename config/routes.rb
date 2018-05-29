Rails.application.routes.draw do

  resources :events
  resources :locations
  resources :categories
  resources :users
  get '/', to: 'users#home', as:'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
