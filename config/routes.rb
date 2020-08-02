Rails.application.routes.draw do

  # Registro y Autenticación de usuario
  devise_for :users, skip: %i[registrations sessions passwords]
  devise_scope :user do
    post '/signup', to: 'registrations#create'
    post  '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end

  # Usuarios
  resources :users

  # Requerimientos
  # resources :requeriments

  # Comentarios
  # resources :comments

  # Votos
  # resources :votes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
