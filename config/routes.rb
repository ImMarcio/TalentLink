Rails.application.routes.draw do
  # get "empresas/dashboard"
  # get "candidatos/dashboard"
  # Rota para a página inicial
  get "home/index"
  root "home#index"

  # Rotas para Devise (autenticação)
  devise_for :candidatos, path: 'candidatos', controllers: {
    registrations: 'candidatos/registrations',
    sessions: 'candidatos/sessions'
  }
  
  devise_for :empresas, path: 'empresas', controllers: {
    registrations: 'empresas/registrations',
    sessions: 'empresas/sessions'
  }

  # Rotas para Empresas
  resources :empresas, only: [:show, :edit, :update] do
    # Rotas para Vagas (aninhadas em Empresas)
    resources :vagas, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end

  # Rotas para Vagas (independentes, para candidatos visualizarem)
  resources :vagas, only: [:index, :show] do
    # Rotas para Candidaturas (aninhadas em Vagas)
    resources :candidaturas, only: [:new, :create]
  end

  # Rotas para Candidaturas (independentes, para candidatos gerenciarem)
  resources :candidaturas, only: [:index, :show, :destroy]

  resources :empresas do
    get 'minhas_candidaturas', on: :member
  end

  resources :candidaturas do
    member do
      patch 'atualizar_status'
    end
  end
  
    # Defina rotas para as páginas de dashboard
    get 'candidato_dashboard', to: 'candidatos#dashboard', as: :candidato_dashboard
    get 'empresa_dashboard', to: 'empresas#dashboard', as: :empresa_dashboard
    get 'minhas_candidaturas', to: 'candidaturas#minhas_candidaturas', as: 'minhas_candidaturas'
      
  
  # Rota de saúde da aplicação
  get "up" => "rails/health#show", as: :rails_health_check
end