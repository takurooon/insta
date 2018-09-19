Rails.application.routes.draw do

  root to: "sessions#new"
  resources :favorites, only: [:index, :create, :destroy]
  resources :blogs
  resources :users, only:[:new, :create, :show]
  resources :sessions, only:[:new, :create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
