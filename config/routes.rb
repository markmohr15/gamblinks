CoolLinks::Application.routes.draw do
  devise_for :users
  root to: "links#index"

  resources :links do
    resources :comments
    resources :votes
  end

end
