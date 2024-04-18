LitestreamRails::Engine.routes.draw do
  get "/" => "processes#show", :as => :root

  resource :process, only: [:show], path: ""
end
