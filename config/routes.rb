VimGenius::Application.routes.draw do

  get 'ui(/:action)', controller: 'ui'

  root to: 'home#index'
  resources :admin, only: [:index]

  resources :lessons, only: [:index, :show] do
    resources :levels, only: :show do
      member do
        get 'congrats'
      end
      resources :commands, only: :show
    end
  end

  match 'admin/login', to: 'admin#login', as: 'admin_login', via: [:get, :post]

  get 'start', to: 'home#start', as: 'start'
  get 'lessons/vim-intro/', to: 'lessons#show', as: 'intro_lesson'

  post 'login', to: 'login#create', as: 'login'
  get 'logout', to: 'login#destroy', as: 'logout'

  namespace 'admin' do
    root to: 'admin#index'
    resources :users, only: [:index]
    resources :lessons do
      resources :levels do
        resources :commands
      end
    end
  end


end
