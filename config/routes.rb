Rails.application.routes.draw do
  devise_for :users
  get '/' => 'cities#index'

  root to: "cities#index"

  resources :cities do
    resources :posts
  end

end
