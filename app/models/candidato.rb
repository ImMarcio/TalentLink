class Candidato < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validações
  validates :nome, presence: true, length: { minimum: 3, maximum: 100 }
  
  validates :telefone, presence: true, uniqueness: true, format: { with: /\A\(\d{2}\) \d{4,5}-\d{4}\z/, message: "deve estar no formato (XX) XXXXX-XXXX" }

  validates :linkedin, presence: true, uniqueness: true, format: { with: /\Ahttps?:\/\/(www\.)?linkedin\.com\/.*\z/, message: "deve ser um link válido do LinkedIn" }

  validates :area_atuacao, presence: true, length: { minimum: 3, maximum: 50 }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Associações
  has_many :candidaturas, dependent: :destroy
  has_many :vagas, through: :candidaturas
end
