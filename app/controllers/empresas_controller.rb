class EmpresasController < ApplicationController
  before_action :authenticate_empresa! # Garante que o usuário esteja logado

  def dashboard
    # Aqui você pode adicionar lógica específica para o dashboard da Empresa
    @empresa = current_empresa
    @vagas = Vaga.all
  
  end

  def minhas_candidaturas
    # Pega todas as vagas da empresa logada
    @vagas = current_empresa.vagas

    # Busca as candidaturas das vagas da empresa logada
    @candidaturas = Candidatura.where(vaga_id: @vagas.pluck(:id))
  end

  
  def vagas_cadastradas
    @empresa = current_empresa
    # Pega todas as vagas da empresa logada
    @vagas = current_empresa.vagas
  end
end
