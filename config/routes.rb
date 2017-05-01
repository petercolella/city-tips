Rails.application.routes.draw do
  # Devise route setup
  devise_for :users, controllers: {
	registrations: 'users/registrations'
}
  # Setting the root route
  root to: "static_pages#welcome"

  # Generate default routes for Users
  resources :users

  # Generate nested routes for Cities and Posts
  resources :cities do
    resources :posts
  end

end
