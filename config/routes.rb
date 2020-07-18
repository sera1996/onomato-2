Rails.application.routes.draw do
  resources :favors
  resources :surveys
  devise_for :accounts
  resources :onomatopoeia
  get 'onomatopoeia/new/:id', to: "onomatopoeia#new"
  get 'embosses/new/:id', to: "embosses#new"
  get 'hardnesses/new/:id', to: "hardnesses#new"
  get 'favors/new/:dimension_name/:id', to: "favors#new"
  get 'wetnesses/new/:id', to: "wetnesses#new"
  resources :categories
  get '/', to: "categories#index"
  get 'samples', to: "samples#index"
  get '/word2vec_sentence', to: "py_nums#python"
  post '/word2vec_sentence', to: "py_nums#word2vec"
  get '/visuword', to: "py_nums#visuword"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
