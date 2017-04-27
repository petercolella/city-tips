Rails.application.routes.draw do
  devise_for :users

  root to: "cities#index"

  resources :users

  resources :cities do
    resources :posts
  end

end
