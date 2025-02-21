class VagasController < ApplicationController
  before_action :authenticate_empresa!, only: [:new, :create, :edit, :update, :destroy]  # Exige autenticação da empresa apenas para as ações de criação, edição, atualização e exclusão
  before_action :set_current_empresa
  before_action :set_vaga, only: [:edit, :update, :destroy]  # Ação de encontrar a vaga para editar, atualizar e excluir

  def set_current_empresa
    @current_empresa = current_empresa
  end

  # Listar todas as vagas (sem restrições para o candidato)
  def index
    @vagas = Vaga.all
    # Não é necessário autorizar aqui para candidatos, já que qualquer usuário pode acessar
  end

  # Mostrar detalhes de uma vaga específica (sem restrições para o candidato)
  def show
    @vaga = Vaga.find(params[:id])
    # Não é necessário autorizar aqui para candidatos, já que qualquer usuário pode acessar
  end

  # Exibir formulário para criar uma nova vaga
  def new
    @vaga = Vaga.new
    #  authorize! :create, @vaga  # Garante que a empresa tem permissão para criar uma nova vaga
  end

  # Criar uma nova vaga
  def create
    @vaga = @current_empresa.vagas.new(vaga_params)
    # authorize! :create, @vaga  # Garante que a empresa tem permissão para criar uma nova vaga

    if @vaga.save
      redirect_to empresa_vagas_path(current_empresa), notice: 'Vaga criada com sucesso.'
    else
      render :new
    end
  end

  # Exibir formulário para editar uma vaga
  def edit
    # Já está com o @vaga carregado via before_action
    # authorize! :update, @vaga  # Garante que a empresa tem permissão para editar essa vaga
  end

  # Atualizar uma vaga
  def update
    authorize! :update, @vaga  # Garante que a empresa tem permissão para atualizar a vaga

    if @vaga.update(vaga_params)
      redirect_to empresa_vaga_path(@vaga.empresa, @vaga), notice: 'Vaga atualizada com sucesso.'
    else
      render :edit
    end
  end

  # Excluir uma vaga
  def destroy
    # authorize! :destroy, @vaga  # Garante que a empresa tem permissão para excluir essa vaga

    @vaga.destroy
    redirect_to empresa_vagas_path(@vaga.empresa), notice: 'Vaga excluída com sucesso.'
  end

  private

  # Método para encontrar a vaga com base no id (utilizado nas ações edit, update e destroy)
  def set_vaga
    @vaga = Vaga.find(params[:id])
  end

  # Método para permitir apenas os parâmetros seguros
  def vaga_params
    params.require(:vaga).permit(:titulo, :descricao, :salario, :localizacao)
  end
end
