Rails.application.routes.draw do  
  devise_for :users
  resources :newsletters
  get 'newsletters/send'
  resources :cocktails do
    resources :doses, only: [:index, :new, :show]
  end
  root :to => 'pages#home'
end
