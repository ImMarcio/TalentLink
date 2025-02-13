class CreateCandidaturas < ActiveRecord::Migration[8.0]
  def change
    create_table :candidaturas do |t|
      t.references :candidato, null: false, foreign_key: true
      t.references :vaga, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
