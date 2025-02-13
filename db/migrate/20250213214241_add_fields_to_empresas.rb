class AddFieldsToEmpresas < ActiveRecord::Migration[8.0]
  def change
    add_column :empresas, :nome_fantasia, :string
    add_column :empresas, :razao_social, :string
    add_column :empresas, :cnpj, :string
    add_column :empresas, :telefone, :string
    add_column :empresas, :setor, :string
  end
end
