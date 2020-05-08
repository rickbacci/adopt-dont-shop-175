Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id/edit', to: 'shelters#edit'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  patch '/shelters/:id', to: 'shelters#update'

  root 'shelters#index'
end
