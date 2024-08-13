Rails.application.routes.draw do
  root "landing_page#index"
  devise_for :users

  resources :games do 
    resources :notes, only: [:new, :create, :show, :edit, :destroy, :update]
  end
  resources :notes, only: [:index]

  get "/search" => "search#index"

end
