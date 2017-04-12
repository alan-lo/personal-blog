Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/posts' => 'posts#index'
  #
  # get '/posts/show' => 'posts#show'
  get '/' => 'posts#index'
  # get '/passwords/validate_email' => 'passwords#validate_email'
  # post '/passwords/resetpassword' => 'passwords#resetpassword'
  # patch '/passwords/reset' => 'passwords#reset'


  # get '/password_resets/link' => 'password_resets#link'

  resources :password_resets

  resources :posts, shallow: true do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:create, :new, :edit, :update] do
    resources :likes, only: [:index]
  end

  resources :passwords

  resources :sessions, only: [:new, :create] do
  delete :destroy, on: :collection
  end

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]
  
end
