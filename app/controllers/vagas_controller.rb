class VagasController < ApplicationController
  before_action :authenticate_empresa!, only: [:new, :create, :edit, :update, :destroy]  # Para empresas
  before_action :set_vaga, only: [:edit, :update, :destroy, :show]  # Ação show também precisa setar a vaga
  
  def new
    @vaga = Vaga.new
    authorize! :create, Vaga # Verifica se a empresa tem permissão para criar
  end

  def create
    @vaga = current_empresa.vagas.new(vaga_params)
    authorize! :create, @vaga # Verifica se a empresa tem permissão para criar

    if @vaga.save
      redirect_to empresa_vagas_path(current_empresa), notice: 'Vaga criada com sucesso.'
    else
      render :new
    end
  end

  def index
    authorize! :index, @vaga
    @vagas = Vaga.all
    # Não é necessário autorizar aqui para candidatos, já que qualquer usuário pode acessar
  end

  def show
    authorize! :index, @vaga
    @vaga = Vaga.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to vagas_path, alert: "Vaga não encontrada"
  end

  def edit
    authorize! :update, @vaga # Verifica se a empresa tem permissão para editar
  end

  def update
    authorize! :update, @vaga # Verifica se a empresa tem permissão para editar

    if @vaga.update(vaga_params)
      redirect_to empresa_vaga_path(@vaga.empresa, @vaga), notice: 'Vaga atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @vaga # Verifica se a empresa tem permissão para excluir
    @vaga.destroy
    redirect_to vagas_cadastradas_empresa_path(@vaga.empresa), notice: 'Vaga excluída com sucesso.'
  end

  private

  def set_vaga
    @vaga = Vaga.find(params[:id])
  end

  def vaga_params
    params.require(:vaga).permit(:titulo, :descricao, :salario, :localizacao)
  end
end
