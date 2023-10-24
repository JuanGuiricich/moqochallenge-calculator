Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'calculator', to: 'calculator#evaluate'
  # Defines the root path route ("/")
  # root "articles#index"
end
