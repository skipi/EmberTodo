Todo::Application.routes.draw do
  resources :todo_items

  namespace :api do
    resources :todo_items
  end
  root to: 'todo_items#index'
end
