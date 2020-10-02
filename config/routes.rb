Rails.application.routes.draw do
  root 'welcome#list'


  get 'list' => 'welcome#list'
  post 'list' => 'welcome#list'

  get 'register' => 'welcome#register'
  post 'register' => 'welcome#register'
  get 'welcome/ok' => 'welcome#ok'
  post 'welcome/ok' => 'welcome#ok'
  get 'welcome/ng' => 'welcome#ng'
  post 'welcome/ng' => 'welcome#ng'

 
  get 'checkdata/:restid' => 'welcome#checkdata'
  post 'checkdata/:restid' => 'welcome#checkdata'
  get 'create' => 'welcome#create'
  post 'create' => 'welcome#create'
  get 'destroy' => 'welcome#destroy'
  post 'destroy' => 'welcome#destroy'

  get 'update/:restid' => 'welcome#update'
  post 'update/:restid' => 'welcome#update'

  get 'update_ok' => 'welcome#update_ok'
  post 'update_ok' => 'welcome#update_ok'
  get 'update_ng' => 'welcome#update_ng'
  post 'update_ng' => 'welcome#update_ng'

  get 'about' => 'welcome#about'
  post 'about' => 'welcome#about'

  get 'login' => 'welcome#login'
  post 'login' => 'welcome#login'

  #  resources :welcome do
    #  get :search, on: :collection
  #  end
  end


