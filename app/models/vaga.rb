class Vaga < ApplicationRecord
  belongs_to :empresa
  has_many :candidaturas, dependent: :destroy
  has_many :candidatos, through: :candidaturas

  validates :titulo, :descricao, :salario, :localizacao, presence: true
end