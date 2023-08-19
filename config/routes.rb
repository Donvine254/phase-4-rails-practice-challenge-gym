Rails.application.routes.draw do
  resources :memberships, only: [:create, :update, :index]
  resources :gyms
  resources :clients, only: %i[show create index update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
