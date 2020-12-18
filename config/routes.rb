Rails.application.routes.draw do
  devise_for :users
  get "/inscription-club", to: "pages#newsletter"
  resources :cocktails do
    resources :doses, only: [:index, :new, :show]
  end
  root :to => 'cocktails#index'
end
