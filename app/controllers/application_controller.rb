class ApplicationController < ActionController::Base
  before_action :authenticate_user

  protected

  def authenticate_user
    # Verifica qual modelo de usuário está logado e chama a autenticação para ele
    if candidato_signed_in?
      authenticate_candidato!
    elsif empresa_signed_in?
      authenticate_empresa!
    end
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
