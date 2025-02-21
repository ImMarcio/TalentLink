class CandidatosController < ApplicationController
  before_action :authenticate_candidato! # Garante que o Candidato esteja logado

  def dashboard
    @candidato = current_candidato 
    @vagas = Vaga.all
  end
end
