class Vaga < ApplicationRecord
  belongs_to :empresa
  has_many :candidaturas, dependent: :destroy
  has_many :candidatos, through: :candidaturas

  # Validações
  validates :titulo, presence: { message: "não pode estar em branco" }, length: { maximum: 100, message: "deve ter no máximo 100 caracteres" }
  validates :descricao, presence: { message: "não pode estar em branco" }, length: { minimum: 10, message: "deve ter pelo menos 10 caracteres" }
  validates :salario, presence: { message: "não pode estar em branco" }, numericality: { greater_than_or_equal_to: 0, message: "deve ser um valor positivo" }
  validates :localizacao, presence: { message: "não pode estar em branco" }, length: { maximum: 150, message: "deve ter no máximo 150 caracteres" }

  # Validação customizada para o salário (caso queira um limite máximo)
  validate :salario_razoavel

  private

  def salario_razoavel
    if salario.present? && salario > 1_000_000
      errors.add(:salario, "está muito alto para uma vaga comum")
    end
  end
end
