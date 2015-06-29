Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists do
    resources :tasks do
      member do
        patch :done
      end
    end
  end
end
