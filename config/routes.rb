Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  devise_for :users, path: '', path_names: { sign_in: 'prihlasit', sign_out: 'odhlasit', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'registracia', sign_up: '' }


end
