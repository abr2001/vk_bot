Rails.application.routes.draw do
  resources :comment_posts do
    member do
      post 'bot'
    end
  end
  resources :posts
  resources :comment_accounts
  resources :potirs

  resources :post_groups do
    resources :posts, shallow: true
    post 'add_posts_from_file' => 'posts#from_file'
    get 'to_file' => "posts#to_file"
  end

  resources :keyphrases do
    resources :phrases, shallow: true do
      member do
        post 'up'
        post 'down'
      end
    end
  end

  resources :total_phrases do
    collection do
      get 'headers'
      get 'footers'
      get 'new_header'
      get 'new_footer'
    end
  end

  resources :accounts do
    resources :tails
    get 'clear_all_tails' => 'tails#clear_all'
    get 'actions' => 'vk#actions'
    get 'test_vk' => 'vk#test_vk'
    post 'add_friends_get' => 'vk#add_friends_get'
    post 'add_friends_from_file' => 'vk#add_friends_from_file'
    get 'auto_posts' => 'post_groups#select'
  end

  post 'checked_commenter' => 'accounts#commenter'

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  devise_for :users
  resources :users do
    get 'list_accounts' => 'users#list_accounts'
  end

  authenticate :user, lambda { |user| user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'accounts#index'

  post '/auth_vk' => 'vk#auth_vk'
  get '/error_api_log' => 'vk#error_api_log'
  get 'help' => 'home#help'

  get 'front' => 'home#front'
  get 'comments_log' => "vk#comments_log"
  get 'my_ip' => 'home#my_ip'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'comments_log' => "comments#log"
      get 'my_ip' => "public#my_ip"
      resources :post_groups, only: [] do
        resources :posts, shallow: true, only: [:index]
      end
    end
  end
end
