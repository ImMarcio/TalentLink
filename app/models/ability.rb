class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.is_a?(Empresa)
      can :manage, Vaga, empresa_id: user.id
    elsif user.is_a?(Candidato)
      can :create, Candidatura
      can :read, Vaga
    end
  end
end
