class Servico < ApplicationRecord
  validates :nome, presence: true
  validates :nome, length: {minimum:4}
end
