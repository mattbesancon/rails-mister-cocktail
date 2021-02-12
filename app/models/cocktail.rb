class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true, allow_blank: false
  validates :photo, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  ratyrate_rateable 'original_score'

  def previous
    Cocktail.where(["id < ?", id]).last
  end
  
  def next
    Cocktail.where(["id > ?", id]).first
  end
end
