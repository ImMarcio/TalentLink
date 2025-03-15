# README
# Talent Link - Documentação do Projeto

Para mais informações, veja o [arquivo de testes de autorização](ability_test.md).

Para mais informações, veja o [arquivo de validators](validators.md).


## Visão Geral

O **Talent Link** é uma plataforma de recrutamento e seleção criada para otimizar o processo de contratação de empresas e candidatos. A plataforma oferece funcionalidades para empresas gerenciarem vagas, enquanto candidatos podem se inscrever em vagas e acompanhar o status de suas candidaturas.

Foi desenvolvido em **Ruby on Rails** e utiliza **PostgreSQL** como banco de dados. O sistema possui quatro principais entidades: **Empresa**, **Candidato**, **Vagas** e **Candidatura**, que interagem de formas específicas, permitindo que tanto empresas quanto candidatos gerenciem de forma eficiente o processo seletivo.

## Entidades

### 1. **Empresa**
   - **Criação de Vagas**: A empresa pode criar novas vagas de emprego e definir os requisitos para cada uma delas.
   - **Exclusão de Vagas**: A empresa pode excluir vagas criadas, caso não precise mais delas.
   - **Gestão de Candidaturas**: A empresa pode aprovar ou reprovar candidaturas de candidatos às suas vagas.
   - **Visualização de Candidaturas**: A empresa pode visualizar todas as candidaturas feitas para suas vagas e analisar o progresso de cada uma.
   - **Visualização de Vagas**: A empresa pode visualizar todas as vagas que criou.

### 2. **Candidato**
   - **Inscrição em Vagas**: O candidato pode se inscrever em vagas de emprego, demonstrando interesse na posição.
   - **Criação de Candidatura**: Quando se inscreve, o candidato cria uma candidatura, que pode ser analisada pela empresa responsável pela vaga.
   - **Visualização de Candidaturas**: O candidato pode visualizar todas as candidaturas que fez e o status de cada uma delas (se foi aprovada, reprovada ou está em análise).

### 3. **Vagas**
   - **Atributos**: Cada vaga possui atributos como nome, descrição, requisitos e status (aberta, fechada, em análise, etc.).
   - **Relação com Empresa**: Uma vaga é sempre associada a uma empresa que a criou.

### 4. **Candidatura**
   - **Atributos**: Cada candidatura contém informações como a data de inscrição, o status da candidatura (pendente, aprovada, reprovada) e a vaga associada.
   - **Relação com Candidato e Vaga**: Uma candidatura é vinculada a um candidato e a uma vaga específica.

## Funcionalidades

### 1. **Gestão de Vagas para Empresas**
   - Empresas podem criar novas vagas, definir os requisitos e publicar para os candidatos se inscreverem.
   - Empresas podem excluir vagas quando não forem mais necessárias.
   - Empresas têm a possibilidade de visualizar todas as vagas criadas e seus respectivos status.

### 2. **Gestão de Candidaturas para Empresas**
   - Empresas podem ver todas as candidaturas feitas para suas vagas.
   - Cada candidatura pode ser aprovada ou reprovada de acordo com os critérios definidos pela empresa.
   - O status de cada candidatura é atualizado em tempo real e pode ser visualizado pela empresa.

### 3. **Inscrição e Criação de Candidaturas para Candidatos**
   - Candidatos podem se inscrever nas vagas de seu interesse.
   - Cada inscrição cria uma candidatura, que ficará visível para a empresa responsável pela vaga.
   - Candidatos podem visualizar o status de todas as suas candidaturas (aprovada, reprovada ou pendente).

### 4. **Visualização de Vagas e Candidaturas**
   - Candidatos podem visualizar as vagas abertas e se inscrever nas que mais lhe interessam.
   - Empresas podem visualizar as candidaturas feitas a suas vagas e tomar decisões sobre cada uma.

## Tecnologias Utilizadas

- **Backend**: Ruby on Rails
- **Banco de Dados**: PostgreSQL
- **Frontend**: HTML
- **Autenticação**: Devise (para autenticação de usuários)
- **Autenticação**: CanCanCan (para autorização de usuários)
- **API**: RESTful APIs para comunicação entre frontend e backend

## Estrutura do Projeto

### Backend

- **/app**
  - **/controllers**: Controladores responsáveis pela lógica de negócios das entidades.
  - **/models**: Modelos de dados que representam as entidades **Empresa**, **Candidato**, **Vaga** e **Candidatura**.
  - **/routes**: Rotas para a API, incluindo endpoints para empresas e candidatos.
.
  

