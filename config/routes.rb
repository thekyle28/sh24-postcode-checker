Rails.application.routes.draw do
  root to: 'postcode_checker#index' 
  get 'postcode_checker', to: 'postcode_checker#index'
  post 'postcode_checker', to: 'postcode_checker#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
