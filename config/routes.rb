ChiliProject::Application.routes.draw do
  resources :projects

  root 'projects#index'
end
