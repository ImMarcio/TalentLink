class Empresa < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validações
  validates :nome_fantasia, presence: true, length: { minimum: 3, maximum: 100 }
  validates :razao_social, presence: true, length: { minimum: 3, maximum: 100 }
  
  validates :cnpj, presence: true, uniqueness: true, format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/, message: "deve estar no formato 00.000.000/0000-00" }
  
  validates :telefone, presence: true, format: { with: /\A\(\d{2}\) \d{4,5}-\d{4}\z/, message: "deve estar no formato (XX) XXXXX-XXXX" }

  validates :setor, presence: true, length: { minimum: 3, maximum: 50 }

  # Associações
  has_many :vagas, dependent: :destroy
end
