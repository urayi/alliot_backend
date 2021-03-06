  Rails.application.routes.draw do

  # Registro y Autenticación de usuario
  devise_for :users, skip: %i[registrations sessions passwords]
  devise_scope :user do
    post '/signup', to: 'registrations#create'
    post  '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
  
  namespace :api do
    namespace :v1 do
      
      # Usuarios
      resources :users
      
      # Requerimientos
      resources :requirements

      # Comentarios
      get '/comments/requirement/:requirement_id', to: 'comments#list'
      resources :comments
      
      # Votos
      # Crear/Editar Voto
      put '/votes/requirement/:requirement_id', to: 'votes#edit'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
