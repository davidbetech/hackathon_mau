class Mercado < ApplicationRecord
  has_many :productos, dependent: :destroy
  validate :presence, :nombre, :alcaldia, :ubicacion
end
