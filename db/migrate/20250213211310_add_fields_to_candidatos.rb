class AddFieldsToCandidatos < ActiveRecord::Migration[8.0]
  def change
    add_column :candidatos, :nome, :string
    add_column :candidatos, :telefone, :string
    add_column :candidatos, :linkedin, :string
    add_column :candidatos, :area_atuacao, :string
  end
end
