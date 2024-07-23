Rails.application.routes.draw do
  root "users#show"
  devise_for :users

  resources :notes
  resources :games

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # destroy "/users/sign_out" => "users#destroy"
  
  

end
