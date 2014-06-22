CoolLinks::Application.routes.draw do
  devise_for :users
  root to: "links#index"

  resources :links do
    resources :votes
    resources :comments do
      resources :comment_votes, only: [:create]
    end
  end
 resources :users, :id => /.*/ do
  resources :relationships, only: [:create, :destroy]
 end


get "/about", to: "links#about"

end

