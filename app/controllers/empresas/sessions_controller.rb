module Empresas
    class SessionsController < Devise::SessionsController
      def after_sign_in_path_for(resource)
        empresa_dashboard_path 
      end
    end
  end