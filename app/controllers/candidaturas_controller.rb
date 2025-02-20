class CandidaturasController < ApplicationController
  before_action :authenticate_candidato!


  def new
    @vaga = Vaga.find(params[:vaga_id])  # Busca a vaga correta
    @candidatura = Candidatura.new(vaga: @vaga, candidato: current_candidato)
  end
  
  def minhas_candidaturas
    @candidaturas = Candidatura.where(candidato_id: current_candidato.id)
  end

  def create
    @vaga = Vaga.find(params[:vaga_id])
    @candidatura = @vaga.candidaturas.new(candidatura_params)
    @candidatura.candidato = current_candidato  # Define o candidato automaticamente
  
    if @candidatura.save
      redirect_to @candidatura, notice: 'Candidatura criada com sucesso.'
    else
      render :new
    end
  end

  def show
    @candidatura = Candidatura.find(params[:id])
  end

  def index
    @candidaturas = Candidatura.all
  end
  


  private

  def candidatura_params
    params.require(:candidatura).permit(:vaga_id, :status)
  end
end