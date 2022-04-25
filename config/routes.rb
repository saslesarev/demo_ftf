Rails.application.routes.draw do
  resources :challenges
  post 'challenges/:id/solve', to: 'challenges#solve', as: :challenge_solve
  
  root "challenges#index"
end
