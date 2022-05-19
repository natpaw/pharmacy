Rails.application.routes.draw do
  resources :ordered_medicines
  resources :prescriptions
  resources :orders do
		resources :ordered_medicines
	end
  resources :medicines
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :pharmacists, controllers: { sessions: 'pharmacists/sessions' }
  devise_for :doctors, controllers: { sessions: 'doctors/sessions' }
  post "users/sign_up", to: "users#create"
  get "users/sign_up", to: "users#new"
  post "doctors/sign_up", to: "doctors#create"
  get "doctors/sign_up", to: "doctors#new"
  post "pharmacists/sign_up", to: "pharmacists#create"
  get "pharmacists/sign_up", to: "pharmacists#new"
  resources :doctors
  resources :pharmacists
  resources :users
  get 'welcome/index'
  root 'welcome#index'
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
