VimGenius::Application.routes.draw do

  get 'ui(/:action)', controller: 'ui'

  root to: 'home#index'
  resources :admin, only: [:index]
  resources :lessons do
    resources :levels
  end

  match 'admin/login', to: 'admin#login', as: 'admin_login', via: [:get, :post]

  get 'start', to: 'home#start', as: 'start'
  get 'lessons/vim-intro/', to: 'lessons#show', as: 'intro_lesson'

  namespace 'admin' do
    root to: 'admin#index'
    resources :users, only: [:index]
    resources :lessons do
      resources :levels
    end
  end


end
