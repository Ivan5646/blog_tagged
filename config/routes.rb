Rails.application.routes.draw do
  get 'tags/:tag', to: 'articles#index', as: :tag
  resources :articles do
    resources :comments
  end
 
  root 'welcome#index'
end
