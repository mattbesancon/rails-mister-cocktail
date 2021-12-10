class Ingredient < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name]
  validates :name, presence: true, uniqueness: true
  has_many :cocktails, through: :doses
  has_many :doses

  def image_urls
    Ingredient.all.select { |m| m.liquor == true }.map { |m| m.photo }
  end
end
