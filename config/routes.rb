Rails.application.routes.draw do
  resources :ordered_medicines
  resources :prescriptions
  resources :orders do
		resources :ordered_medicines
	end
  resources :medicines
  resources :doctors
  resources :pharmacists
  resources :users
  get 'welcome/index'
  root 'welcome#index'
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
