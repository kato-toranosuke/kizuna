Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index' => 'welcome#index'
  get 'welcome/search' => 'welcome#search'
  get 'welcome/admin' => 'welcome#admin'
  get 'welcome/result' => 'welcome#result'
  get 'welcome/comment' => 'welcome#comment'
  post 'welcome/comment' => 'welcome#comment'
  get 'welcome/practice' => 'welcome#practice'
  get 'welcome/practice2' => 'welcome#practice2'
  post 'welcome/practice2' => 'welcome#practice2'
  
  #  resources :welcome do
    #  get :search, on: :collection
  #  end
  end


