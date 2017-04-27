Rails.application.routes.draw do
  get 'users/show'

  get 'posts/index'

  get 'posts/show'

  devise_for :users
  get '/' => 'cities#index'

  root to: "cities#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
