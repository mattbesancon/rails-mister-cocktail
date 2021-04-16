class Ingredient < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name]
  validates :name, presence: true, uniqueness: true
  has_many :cocktails, through: :doses
  has_many :doses
end
