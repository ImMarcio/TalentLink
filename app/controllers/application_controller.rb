class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protected

  def configure_permitted_parameters
    #Candidatos
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :telefone, :linkedin, :area_atuacao])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :telefone, :linkedin, :area_atuacao])
    
    #Empresas
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome_fantasia, :razao_social, :cnpj, :telefone, :setor])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome_fantasia, :razao_social, :cnpj, :telefone, :setor])
  end



end
