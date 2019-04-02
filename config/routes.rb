Rails.application.routes.draw do
  resources :yeast_types do
    collection { post :import }
    collection { post :clip }
  end
end
