class CandidatosController < ApplicationController
  before_action :authenticate_candidato! # Garante que o Candidato esteja logado

  def dashboard
    # Lógica específica para o dashboard do Candidato
    # Aqui você pode adicionar variáveis para exibir informações do candidato, por exemplo:
    @candidato = current_candidato # Acessa o candidato logado
    @vagas = Vaga.all
  end
end
