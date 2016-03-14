Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
	#resources :tags
	get 'tags/:tag', to: 'articles#index', as: "tag"
	
  root 'welcome#index'
end
