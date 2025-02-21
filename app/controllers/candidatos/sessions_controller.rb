module Candidatos
    class SessionsController < Devise::SessionsController
      def after_sign_in_path_for(resource)
         Rails.logger.info "Candidato logado: #{resource.inspect}"
        candidato_dashboard_path # Redireciona para o dashboard do Candidato
      end
    end
  end