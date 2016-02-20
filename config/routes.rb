Rails.application.routes.draw do
  devise_for :users
  get 'admin/index'
  
  mount ApplicationAPI => '/api'

end
