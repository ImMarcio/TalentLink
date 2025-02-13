class CreateVagas < ActiveRecord::Migration[8.0]
  def change
    create_table :vagas do |t|
      t.string :titulo
      t.text :descricao
      t.text :requisitos
      t.float :salario
      t.string :localizacao
      t.string :status
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
