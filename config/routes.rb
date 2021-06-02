Rails.application.routes.draw do  
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  resources :newsletters
  get 'newsletters/send'
  resources :cocktails do
    resources :doses, only: [:index, :new, :show]
  end
  root :to => 'cocktails#index'
end
