Rails.application.routes.draw do
  devise_for :users, controllers: {
	registrations: 'users/registrations'
}

  root to: "static_pages#welcome"

  resources :users
  resources :cities do
    resources :posts
  end

end
