VimGenius::Application.routes.draw do

  get 'ui(/:action)', controller: 'ui'

  root to: 'home#index'

  resources :admin, only: [:index]

  resources :lessons

  match '/admin/login', to: 'admin#login', as: 'admin_login', via: [:get, :post]

  namespace 'admin' do
    root to: 'admin#index'
    resources :users
    resources :lessons
  end


end
