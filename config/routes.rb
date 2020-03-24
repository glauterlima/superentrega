Rails.application.routes.draw do
  resources :grupos
  get 'servicos/busca', to: 'servicos#busca', as: :busca_servico
  resources :servicos, only: [ :new, :create, :destroy ]
  root to: 'servicos#index'
end
