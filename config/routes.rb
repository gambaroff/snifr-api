Rails.application.routes.draw do
  post 'logins/create'
  get 'sessions/create'
  delete 'sessions/destroy'

  resources :users, except: [:show, :create, :destroy, :new]
  get 'signup' => "logins#new"

  root 'users#index'
end
