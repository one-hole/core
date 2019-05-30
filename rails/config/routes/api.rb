defaults format: :json do
  namespace :api do
    resources :schedules, only: [:index]
    resources :battles,   only: [:index, :show]
  end
end