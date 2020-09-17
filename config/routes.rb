Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/create' => 'welcome#create'
  post 'welcome/create' => 'welcome#create'

  get 'welcome/destroy' => 'welcome#destroy'
  post 'welcome/destroy' => 'welcome#destroy'

  get 'welcome/list' => 'welcome#list'
  post 'welcome/list' => 'welcome#list'
  get 'welcome/register' => 'welcome#register'
  post 'welcome/register' => 'welcome#register'
  get 'welcome/ok' => 'welcome#ok'
  post 'welcome/ok' => 'welcome#ok'
  get 'welcome/ng' => 'welcome#ng'
  post 'welcome/ng' => 'welcome#ng'

  get 'welcome/checkdata' => 'welcome#checkdata'
  post 'welcome/checkdata' => 'welcome#checkdata'
  get 'welcome/checkdata/:restid' => 'welcome#checkdata'
  post 'welcome/checkdata/:restid' => 'welcome#checkdata'
  
  get 'welcome/update' => 'welcome#update'
  post 'welcome/update' => 'welcome#update'
  get 'welcome/update/:restid' => 'welcome#update'
  post 'welcome/update/:restid' => 'welcome#update'

  get 'welcome/update_ok' => 'welcome#update_ok'
  post 'welcome/update_ok' => 'welcome#update_ok'
  get 'welcome/update_ng' => 'welcome#update_ng'
  post 'welcome/update_ng' => 'welcome#update_ng'



  #  resources :welcome do
    #  get :search, on: :collection
  #  end
  end


