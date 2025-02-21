class Empresa < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  validates :nome_fantasia, presence: true
  validates :razao_social, presence: true
  validates :cnpj, presence: true, uniqueness: true
  validates :telefone, presence: true
  validates :setor, presence: true
  
  validates :nome_fantasia, :razao_social, :cnpj, :telefone, :setor, presence: true
  validates :cnpj, uniqueness: true

  has_many :vagas
  
end
