Rails.application.routes.draw do

  get 'home/index'
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  devise_for :users, path: '', path_names: {  sign_in: 'prihlasit', 
                                              sign_out: 'odhlasit', 
                                              password: 'secret', 
                                              confirmation: 'verification', 
                                              unlock: 'unblock', 
                                              registration: 'registracia',
                                              edit: 'upravit/profil',
                                              sign_up: '' 
                                            }

#ARTICLES
  get 'clanky/adminlist', to: 'articles#adminList', as: 'adminList_articles'
  get 'clanky(/:category)', to: 'articles#index', as: 'articles'
  get 'clanky/tag/:tag', to: 'articles#index', as: 'articles_tag'
  get 'clanok/pridat', to: 'articles#new', as: 'add_article'
  post 'clanok/pridat', to: 'articles#create'
  get 'clanok/:id/upravit', to: 'articles#edit', as: 'edit_article'
  patch 'clanok/:id/upravit', to: 'articles#update'
  delete 'clanok/:id/vymazat', to: 'articles#destroy', as: 'delete_article'
  get 'clanok/:id', to: 'articles#show', as: 'article'


 #ADMIN
  namespace :admin do
    #ARTICLE CATEGORY
      get 'kategorieclanky', to: 'article_categories#index', as: 'article_categories'
      post 'kategorieclanky', to: 'article_categories#create', as: 'add_article_category'
      get 'kategoriaclanky/:id/upravit', to: 'article_categories#edit', as: 'edit_article_category'
      patch 'kategoriaclanky/:id/upravit', to: 'article_categories#update'
      delete 'kategoriaclanky/:id/vymazat', to: 'article_categories#destroy', as: 'delete_article_category'


    #USERS
    get 'uzivatelia', to: 'users#index', as: 'users'
    get 'uzivatel/:id/upravit', to: 'users#edit', as: 'edit_user'
    patch 'uzivatel/:id/upravit', to: 'users#update'
    delete 'uzivatelia/:id/vymazat', to: 'users#destroy', as: 'delete_user'

  end

end
