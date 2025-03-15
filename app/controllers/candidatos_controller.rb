class CandidatosController < ApplicationController
  before_action :authenticate_candidato! # Garante que o Candidato esteja logado

  def dashboard
    @candidato = current_candidato 
    @vagas = Vaga.all
  end

  def  vagas_disponiveis
    @candidato = current_candidato 
     # Exclui as vagas em que o candidato já se inscreveu
  @vagas = Vaga.where.not(id: @candidato.candidaturas.pluck(:vaga_id))
  end
 
end
