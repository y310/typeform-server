Rails.application.routes.draw do
  root 'typeforms#index'

  resources :typeforms do
    resources :results, only: [:create, :index, :show]
  end
end
