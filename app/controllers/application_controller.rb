class ApplicationController < ActionController::Base
  before_action :authenticate_user


  def current_ability
    @current_ability ||= Ability.new(current_member)
  end

  private

  # Método que retorna o usuário logado
  def current_member
    # Pode retornar o candidato ou empresa baseado no tipo de usuário autenticado
    current_candidato || current_empresa
  end


  protected

  def authenticate_user
    # Verifica qual modelo de usuário está logado e chama a autenticação para ele
    if candidato_signed_in?
      authenticate_candidato!
    elsif empresa_signed_in?
      authenticate_empresa!
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def configure_permitted_parameters
    # Permissões para Candidatos
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :telefone, :linkedin, :area_atuacao])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :telefone, :linkedin, :area_atuacao])
    
    # Permissões para Empresas
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome_fantasia, :razao_social, :cnpj, :telefone, :setor])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome_fantasia, :razao_social, :cnpj, :telefone, :setor])
  end
end
