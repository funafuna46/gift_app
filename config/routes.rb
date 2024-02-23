Rails.application.routes.draw do
  root 'static_pages#index'
  get 'static_pages/completion'
  get 'static_pages/select_gift_type'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: %i[show create edit update]
  resources :gifts, only: %i[index show] do
    resources :favorites, only: %i[create destroy]
  end

  resource :mypage, only: :show

  resources :template_gifts, only: %i[index] do
    collection do
      post :preview
    end
  end

  resources :original_gifts, only: %i[index create edit update destroy] do
    collection do
      post :preview
    end
  end

end
