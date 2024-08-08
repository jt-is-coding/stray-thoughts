Rails.application.routes.draw do
  root "landing_page#home"
  devise_for :users

  resources :games do 
    resources :notes, only: [:new, :create, :show, :edit, :destroy, :update]
  end
  resources :notes, only: [:index]

  get "/search" => "search#search_home"
  get "/search/results" => "search#search_results"

end
