Rails.application.routes.draw do
  root 'static_pages#index'
  resources :template_gifts, only: %i[index] do
    collection do
      post :preview
    end
  end

end
