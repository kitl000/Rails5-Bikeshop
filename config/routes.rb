Rails.application.routes.draw do

  resources :users
  resources :products do
    resources :comments
  end

  resources :orders, only: [:index, :show, :create, :destroy]


  post 'static_pages/thank_you'

  post 'payments/create'

  get '/products/:id', to: 'products#show'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'static_pages/landing_page'

	root 'static_pages#index'

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :registrations => "user_registrations" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
