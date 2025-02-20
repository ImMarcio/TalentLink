module Candidatos
    class SessionsController < Devise::SessionsController
      def after_sign_in_path_for(resource)
        candidato_dashboard_path # Redireciona para o dashboard do Candidato
      end
    end
  end