class VagasController < ApplicationController
  before_action :authenticate_empresa!

  before_action :set_current_empresa
  



  def set_current_empresa
    @current_empresa = current_empresa
  end
  # Listar todas as vagas
  def index
    @vagas = Vaga.all
  end

  # Mostrar detalhes de uma vaga específica
  def show
    @vaga = Vaga.find(params[:id])
    
  end

  # Exibir formulário para criar uma nova vaga
  def new
    @vaga = Vaga.new
  end

  # Criar uma nova vaga
  def create
    @vaga = current_empresa.vagas.new(vaga_params)
    if @vaga.save
      redirect_to empresa_vagas_path(current_empresa), notice: 'Vaga criada com sucesso.'
    else
      render :new
    end
  end

  # Exibir formulário para editar uma vaga
  def edit
    @vaga = Vaga.find(params[:id])
  end

  # Atualizar uma vaga
  def update
    @vaga = Vaga.find(params[:id])
    if @vaga.update(vaga_params)
      redirect_to empresa_vaga_path(@vaga.empresa, @vaga), notice: 'Vaga atualizada com sucesso.'
    else
      render :edit
    end
  end

  # Excluir uma vaga
  def destroy
    @vaga = Vaga.find(params[:id])
    @vaga.destroy
    redirect_to empresa_vagas_path(@vaga.empresa), notice: 'Vaga excluída com sucesso.'
  end

  private

  # Método para permitir apenas os parâmetros seguros
  def vaga_params
    params.require(:vaga).permit(:titulo, :descricao, :salario, :localizacao)
  end
end