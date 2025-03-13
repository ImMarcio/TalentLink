class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Empresa)
      # Empresas podem gerenciar suas próprias vagas
      can :manage, Vaga, empresa_id: user.id
      can :read, Vaga
      can :index, Vaga
      # Empresas podem atualizar o status das candidaturas
      can :atualizar_status, Candidatura, vaga: { empresa_id: user.id }
    elsif user.is_a?(Candidato)
      # Candidatos podem apenas ver as vagas
      can :read, Vaga
      can :index, Vaga
      # Candidatos podem criar candidaturas
      can :create, Candidatura
    end
  end
end
