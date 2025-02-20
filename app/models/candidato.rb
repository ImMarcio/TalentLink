class Candidato < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validações
  validates :nome, presence: true
  validates :telefone, presence: true
  validates :linkedin, presence: true
  validates :area_atuacao, presence: true
  
  has_many :candidaturas
  has_many :vagas, through: :candidaturas

end
