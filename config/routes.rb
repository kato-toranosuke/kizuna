Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index' => 'welcome#index'
  get 'welcome/search' => 'welcome#search'
  get 'welcome/admin' => 'welcome#admin'
  get 'welcome/result' => 'welcome#result'
  get 'welcome/comment' => 'welcome#comment'
  
  #  resources :welcome do
    #  get :search, on: :collection
  #  end
  end


