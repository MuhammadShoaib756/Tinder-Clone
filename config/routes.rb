Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:"public#home"
  get 'browse', to: "browse#browse"
  get 'matches', to: "browse#matches"
  post 'approve/:id', to: "browse#approve"
  post 'decline/:id', to: "browse#decline"

end
