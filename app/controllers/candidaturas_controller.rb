class CandidaturasController < ApplicationController
  before_action :authenticate_candidato!, except: [:atualizar_status]  # Exceção para a ação de atualizar_status
  before_action :set_candidatura, only: [:atualizar_status]

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
    @candidatura.status = "em_analise"  # Define o status padrão
  
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

  def atualizar_status
    # Verifica se o usuário atual é uma empresa
    unless current_empresa
      flash[:alert] = "Somente empresas podem atualizar o status da candidatura."
      redirect_to empresa_dashboard_path and return
    end

    novo_status = params[:status]
    logger.debug "Status recebido: #{novo_status}"

    if ["aprovada", "reprovada"].include?(novo_status)
      @candidatura.update(status: novo_status)
      flash[:notice] = "Status atualizado para #{novo_status.humanize}!"
    else
      flash[:alert] = "Status inválido!"
    end

    redirect_to empresa_dashboard_path
  end

  private

  def set_candidatura
    @candidatura = Candidatura.find(params[:id])
  end

  def candidatura_params
    params.require(:candidatura).permit(:vaga_id, :status)
  end
end
