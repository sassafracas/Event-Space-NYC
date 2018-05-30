Rails.application.routes.draw do

get 'search', to: 'events#search', as: 'search'
post 'events/search', to: 'events#results', as: 'results'
post 'users/:id', to: 'users#save', as: 'save'
get 'events/info', to: 'events#info'
  resources :events
  resources :locations
  resources :categories
  resources :users
  get '/', to: 'users#home', as:'home'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  post 'sessions', to: 'sessions#create', as: 'sessions'
  post 'logout', to: 'sessions#destroy', as: 'logout'
end
