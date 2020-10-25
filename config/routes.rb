Rails.application.routes.draw do
  
  get 'users/add_room/:id', to: 'users#add_room'
  patch '/users/add_room/:id', to: 'users#regist_room'
  get 'users/strike/:id', to: 'users#strike'
  patch '/users/strike/:id', to: 'users#regist_time'
  resources :users, only: [:index, :show, :new, :create, :destroy, :edit, :update, :add_room, :strike] do
  end
  get 'users/index'
  get 'users/new'
  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
