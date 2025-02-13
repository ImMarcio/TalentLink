class Candidatura < ApplicationRecord
  belongs_to :candidato
  belongs_to :vaga
end
