Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, only: [:index, :new, :show]
  end
  root :to => 'cocktails#index'
end
