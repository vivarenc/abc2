Rails.application.routes.draw do
  get 'wedding_halls' => 'services#wedding_halls', as: :wedding_halls
  get 'medias' => 'services#medias', as: :medias
  get 'bands' => 'services#bands', as: :bands
  get 'comparsion' => 'costs#comparsion', as: :comparsion
  get 'deploy_guests' => 'guests#deploy', as: :deploy
  get 'my_services' => 'services#my_services', as: :my_services
  #get 'lista_gosci' => 'guests#index', as: :guests
  #get 'szczegoly_goscia' => 'guests#show', as: :guest_details
  #get 'edytuj_goscia' => 'guests#edit', as: :guest_edit
  #get 'dodaj_goscia' => 'guests#new', as: :guest_add
  #get 'home/index'
  resources :costs
  resources :guests
  devise_for :users
  resources :services
  resources :ratings
  resources :calcs
  root 'home#index'
  get 'about' => 'home#about', as: :about
  resources :services do
  resources :ratings end
#  get 'koszta' => as: :costs
#  get 'porownanie' => as: :comparsion
#  get 'lista-gosci' => as: :guests
#  get 'rozmieszczanie' => as: :guests_location
end
