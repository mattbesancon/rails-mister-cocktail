class Ingredient < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name]
  validates :name, presence: true, uniqueness: true
  has_many :cocktails, through: :doses
  has_many :doses

  def alc
    Ingredient.where(["liquor = ?", true])
  end
  
  def non_alc
    Ingredient.where(["liquor = ?", false])
  end
end
