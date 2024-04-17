LitestreamRails::Engine.routes.draw do
  get "/" => "databases#index", :as => :root

  resources :databases, only: [:index], path: ""
end
