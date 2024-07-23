Rails.application.routes.draw do
  devise_for :users

  resources :notes
  resources :games

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  get "/:username" => "users#show", as: :user
  
end
