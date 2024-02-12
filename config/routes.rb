Rails.application.routes.draw do
  root 'static_pages#index'
  get 'static_pages/completion'

  resources :template_gifts, only: %i[index] do
    collection do
      post :preview
    end
  end

  resources :original_gifts, only: %i[index] do
    collection do
      post :preview
    end
  end

end
