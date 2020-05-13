Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/signup', to: 'authentication#signup'
  post '/auth/login', to: 'authentication#login'
  get  '/auth/user', to: 'authentication#user'

  scope '/v1' do
    resources :todos
  end
end
