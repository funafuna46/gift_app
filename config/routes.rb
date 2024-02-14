Rails.application.routes.draw do
  root 'static_pages#index'
  get 'static_pages/completion'
  get 'static_pages/select_gift_type'

  resources :users, only: %i[show create]
  resources :gifts, only: %i[index show]

  resources :template_gifts, only: %i[index] do
    collection do
      post :preview
    end
  end

  resources :original_gifts, only: %i[index create] do
    collection do
      post :preview
    end
  end

end
