Rails.application.routes.draw do
  devise_for :users
  get '/' => 'cities#index'

  root to: "cities#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
