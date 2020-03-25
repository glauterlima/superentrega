class Servico < ApplicationRecord

  belongs_to :grupo, optional: true

  validates :nome, presence: true
  validates :nome, length: {minimum:4}
end
