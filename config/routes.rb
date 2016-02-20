Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  get 'admin/index'
  
  mount ApplicationAPI => '/api'

end
