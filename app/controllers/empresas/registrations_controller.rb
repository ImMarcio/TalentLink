module Empresas
    class RegistrationsController < Devise::RegistrationsController
      before_action :configure_sign_up_params, only: [:create]
      before_action :configure_account_update_params, only: [:update]
  
      protected
  
      def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nome_fantasia, :razao_social, :cnpj, :telefone, :setor])
      end
  
      def configure_account_update_params
        devise_parameter_sanitizer.permit(:account_update, keys: [:nome_fantasia, :razao_social, :cnpj, :telefone, :setor])
      end
    end
  end