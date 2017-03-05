RailsBlog::Application.routes.draw do
  resources :users
  resources :tags
  resources :posts do
    resource :comments
  end

end
