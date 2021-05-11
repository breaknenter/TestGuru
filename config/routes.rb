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
    member do
      get  :result
      post :gist
    end
  end

  resource :badges,   only: :show
  resource :contacts, only: %i[show create]

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end

    resources :badges

    get "/gists", to: "gists#index"
  end
end
