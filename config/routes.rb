Rails.application.routes.draw do
  root "tests#index"

  devise_for :users,
             path: :gurus,
             path_names: { sing_up:  :singup,
                           sign_in:  :login,
                           sign_out: :logout }

  resources :tests, only: %i[index show] do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end
end
