Rails.application.routes.draw do
  get "/inscription-club", to: "pages#newsletter"
  resources :cocktails do
    resources :doses, only: [:index, :new, :show]
  end
  root :to => 'cocktails#index'
end
