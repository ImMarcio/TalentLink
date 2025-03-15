# Testes para Ability.rb no Rails Console

## Abrindo o Rails Console
```sh
rails c
```

## Testando Permissões

### 1️⃣ Teste com um Usuário do Tipo Empresa
```ruby
empresa = Empresa.first # Ou crie um novo Empresa
ability = Ability.new(empresa)

# Testa se a empresa pode gerenciar uma vaga específica
vaga = Vaga.first # ou crie uma vaga associada à empresa
ability.can?(:manage, vaga) # Deve retornar true se empresa_id bater
```

### 2️⃣ Teste com um Usuário do Tipo Candidato
```ruby
candidato = Candidato.first # Ou crie um novo Candidato
ability = Ability.new(candidato)

# Testa se o candidato pode criar uma Candidatura
ability.can?(:create, Candidatura) # Deve retornar true

# Testa se o candidato pode ler uma Vaga
ability.can?(:read, Vaga) # Deve retornar true
```

### 3️⃣ Teste com um Usuário Visitante (Guest)
```ruby
guest = nil
ability = Ability.new(guest)

# Verifica se pode criar uma candidatura (deve ser false)
ability.can?(:create, Candidatura) # false

# Verifica se pode ler vagas (deve ser false, a menos que seja permitido para guests)
ability.can?(:read, Vaga) # Depende da sua regra de negócio
```


# Teste de Atualização de Status de Candidatura

## 2️⃣ Criar Usuários e Dados de Teste

Se ainda não tiver usuários e candidaturas, crie-os no console:

```ruby
# Criando uma empresa
empresa = Empresa.create!(email: "empresa@test.com", password: "123456")

# Criando um candidato
candidato = Candidato.create!(email: "candidato@test.com", password: "123456")

# Criando uma vaga associada à empresa
vaga = Vaga.create!(titulo: "Desenvolvedor Rails", empresa: empresa)

# Criando uma candidatura para a vaga
candidatura = Candidatura.create!(vaga: vaga, candidato: candidato, status: "Em análise")

```

```ruby
# Simulando que o usuário atual é uma empresa
def current_empresa
  empresa
end

# Simulando o envio do parâmetro status
params = { status: "aprovada" }

# Atualizando a candidatura
if ["aprovada", "reprovada"].include?(params[:status])
  candidatura.update(status: params[:status])
  puts "Status atualizado para #{candidatura.status}!"
else
  puts "Status inválido!"
end

OutPut: Status atualizado para aprovada!
```
```ruby
# Simulando que o usuário atual é um candidato
def current_empresa
  nil # O candidato não é uma empresa
end

if current_empresa.nil?
  puts "Somente empresas podem atualizar o status da candidatura."
else
  candidatura.update(status: "reprovada")
end

OutPut: Somente empresas podem atualizar o status da candidatura.
```